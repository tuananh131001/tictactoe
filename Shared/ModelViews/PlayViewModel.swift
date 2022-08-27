//
//  PlayViewModel.swift
//  tictactoe
//
//  Created by William on 13/08/2022.
//

import Foundation
import SwiftUI
import Combine

final class PlayViewModel: ObservableObject {

    @Published var hasMove: Bool = false
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    // left to right 0 to 3
    @Published var mode = "multiplayer"
    @Published var isGameBoardDisabled = false
    @Published var alertItem: AlertItem?
    @Published var currentPlayer: GamePlayerModel = UserDefaults.standard.object(forKey: "currentPlayer") as? GamePlayerModel ?? GamePlayerModel(id: UUID(), name: "sir", score: 1000)
    @Published var listPlayer: [String: Int] = UserDefaults.standard.object(forKey: "players") as? [String: Int] ?? [:]

    //Online
    @Published var currentUser: User!
    @AppStorage("user") private var userData: Data?
    @Published var gameNotification = GameNotification.waitingForPlayer
    @Published var game: Game? {
        didSet {
            if(mode == "multiplayer") {
                checkIfGameIsOver()
                //check the game status
                if game == nil { updateGameNotificationFor(.finished) } else {
                    game?.player2Id == "" ? updateGameNotificationFor(.waitingForPlayer) : updateGameNotificationFor(.started)
                }
            }
        }
    }
    private var cancellables: Set<AnyCancellable> = []

    init() {

        if(mode == "multiplayer") {
            retriveUser()
            if currentUser == nil {
                saveUser()
            }
        }
    }
    func getTheGame() {
        FirebaseService.shared.startGame(with: currentUser.id)
        FirebaseService.shared.$game
            .assign(to: \.game, on: self)
            .store(in: &cancellables)
    }
    func processPlayerMove(for position: Int) {
        guard game != nil else { return }
        var gachaMovePosition = Int.random(in: 0..<9)
        if (mode == "gacha") {
            while isSpareOccupied(in: game?.moves ?? Array(repeating: nil, count: 9), forIndex: gachaMovePosition) {
                gachaMovePosition = Int.random(in: 0..<9)
            }
            game?.moves[gachaMovePosition] = Move(player: .human, boardIndex: gachaMovePosition)
        } else if (mode == "multiplayer") {
            if isSpareOccupied(in: game?.moves ?? Array(repeating: nil, count: 9), forIndex: position) { return }
            game?.moves[position] = Move(player: isPlayerOne(), boardIndex: position)
            game?.blockMoveForPlayerId = currentUser.id
            if (game != nil)
            { FirebaseService.shared.updateGame(game!) }
        } else {
                if isSpareOccupied(in: game?.moves ?? Array(repeating: nil, count: 9), forIndex: position) { return }
                game?.moves[position] = Move(player: .human, boardIndex: position)
        }
        playSound(sound: "click", type: "mp3")
        if(mode == "multiplayer") {
            if checkWinCondition(for: isPlayerOne(), in: game?.moves ?? Array(repeating: nil, count: 9)) {
                game?.winningPlayerId = currentUser.id
                print("you have won!")
                if (game != nil)
                { game?.moves = Array(repeating: nil, count: 9)
                    FirebaseService.shared.updateGame(game!) }
                playSound(sound: "victory", type: "mp3")
                return
            }
        } else {
            if checkWinCondition(for: .human, in: game?.moves ?? Array(repeating: nil, count: 9)) {
                alertItem = AlertContext.humanWin
                currentPlayer.score += 200
                playSound(sound: "victory", type: "mp3")
                return
            }
        }
        if (checkForDraw(in: game?.moves ?? Array(repeating: nil, count: 9))) {
            if(mode == "multiplayer") {
                game?.winningPlayerId = "0"
                print("Draw!")
                if (game != nil)
                { game?.moves = Array(repeating: nil, count: 9)
                    FirebaseService.shared.updateGame(game!) }
            } else {
                alertItem = AlertContext.draw
                playSound(sound: "draw", type: "mp3")
            }
            return
        }
        if (mode != "multiplayer") {
            isGameBoardDisabled = true

            // check for win or draw
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
                let computerPosition = computerMoveLocation(in: game?.moves ?? Array(repeating: nil, count: 9))
                game?.moves[computerPosition] = Move(player: .computer, boardIndex: computerPosition)

                isGameBoardDisabled = false
                if checkWinCondition(for: .computer, in: game?.moves ?? Array(repeating: nil, count: 9)) {
                    alertItem = AlertContext.computerWin
                    currentPlayer.score -= 200
                    playSound(sound: "lose", type: "mp3")
                    return
                }
                if checkForDraw(in: game?.moves ?? Array(repeating: nil, count: 9)) {
                    alertItem = AlertContext.draw
                    playSound(sound: "draw", type: "mp3")
                    return
                }

            }
        }

    }
    // Check already exist
    func isSpareOccupied(in moves: [Move?], forIndex index: Int) -> Bool {
        return moves.contains(where: { $0?.boardIndex == index })
    }
    // MARK - AI SECTION
    // If Ai can win then win
    // If AI cant win , then block
    // If AI cant block, then take middlespare
    func computerMoveLocation(in moves: [Move?]) -> Int {
        let winPatterns: Set<Set<Int>> = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
        let computerMoves = moves.compactMap { $0 }.filter { $0.player == .computer }
        let computerPosition = Set(computerMoves.map { $0.boardIndex })

        if (mode == "hard") {
            // If Ai can win then win
            for pattern in winPatterns {
                let winPosition = pattern.subtracting(computerPosition)
                if winPosition.count == 1 {
                    let isAvaiable = !isSpareOccupied(in: moves, forIndex: winPosition.first!)
                    if isAvaiable { return winPosition.first! }
                }
            }
            // If AI cant win , then block
            let humanMoves = moves.compactMap { $0 }.filter { $0.player == .human }
            let humanPosition = Set(humanMoves.map { $0.boardIndex })

            for pattern in winPatterns {
                let winPosition = pattern.subtracting(humanPosition)
                if winPosition.count == 1 {
                    let isAvaiable = !isSpareOccupied(in: moves, forIndex: winPosition.first!)
                    if isAvaiable { return winPosition.first! }
                }
            }
            // If AI cant block, then take middlespare
            let centerSquare = 4
            if !isSpareOccupied(in: moves, forIndex: centerSquare) {
                return centerSquare
            }
        }
        // If AI can't take middle spare, take random spare
        var movePosition = Int.random(in: 0..<9)
        while isSpareOccupied(in: moves, forIndex: movePosition) {
            movePosition = Int.random(in: 0..<9)
        }
        return movePosition
    }
    func checkWinCondition(for player: Player, in moves: [Move?]) -> Bool {
        let winPatterns: Set<Set<Int>> = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
        // check every pattern is there number in there
        let playerMoves = moves.compactMap { $0 }.filter { $0.player == player }
        let playerPosition = Set(playerMoves.map({ $0.boardIndex }))
        for pattern in winPatterns where pattern.isSubset(of: playerPosition) {
            return true
        }
        return false
    }
    //MARK - END AI SECTION
    func updateGameNotificationFor(_ state: GameState) {
        switch state {
        case .started:
            gameNotification = GameNotification.gameHasStarted
        case .waitingForPlayer:
            gameNotification = GameNotification.waitingForPlayer
        case .finished:
            gameNotification = GameNotification.gameFinished
        }
    }
    func checkForGameBoardStatus() -> Bool {
        return game != nil ? game!.blockMoveForPlayerId == currentUser.id: false
    }

    func checkForDraw(in moves: [Move?]) -> Bool {
        return moves.compactMap { $0 }.count == 9
    }
    func quitGame() {
        FirebaseService.shared.quitTheGame()
    }
    func resetGame() {
        if(mode == "multiplayer") {
            guard game != nil else {
                alertItem = AlertContext.quit
                return
            }
            if game?.rematchPlayerId.count == 1 {
                //start new game
                game?.moves = Array(repeating: nil, count: 9)
                game?.winningPlayerId = ""
                game?.blockMoveForPlayerId = game!.player2Id

            } else if game!.rematchPlayerId.count == 2 {
                game?.rematchPlayerId = []
            }

            game?.rematchPlayerId.append(currentUser.id)

            FirebaseService.shared.updateGame(game!)
        } else {
//            game = Game(id: "", player1Id: "", player2Id: "", blockMoveForPlayerId: ""    , winningPlayerId: "", rematchPlayerId: [], moves: Array(repeating: nil, count: 9))
            listPlayer[currentPlayer.name] = currentPlayer.score
            UserDefaults.standard.set(listPlayer, forKey: "players")
            game!.moves = Array(repeating: nil, count: 9)
        }

    }
    func resetGameObject() {
        if(game == nil) {
            game = Game(id: "", player1Id: "", player2Id: "", blockMoveForPlayerId: "", winningPlayerId: "", rematchPlayerId: [], moves: Array(repeating: nil, count: 9))
        }

    }
    //MARK: - User object
    func saveUser() {
        currentUser = User()
        do {
            print("encoding user object")
            let data = try JSONEncoder().encode(currentUser)
            userData = data
        } catch {
            print("couldnt same user object")
        }

    }
    func retriveUser() {

        guard let userData = userData else { return }

        do {
            print("decoding user")
            currentUser = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            print("no user saved")
        }
    }
    func isPlayerOne() -> Player {
        if(game != nil ? game!.player1Id == currentUser.id: false) {
            return .human
        } else {
            return .computer
        }

    }
    func checkIfGameIsOver() {
        alertItem = nil

        guard game != nil else { return }

        if game!.winningPlayerId == "0" {
            alertItem = AlertContext.draw

        } else if game!.winningPlayerId != "" {

            if game!.winningPlayerId == currentUser.id {
                alertItem = AlertContext.humanWin
            } else {
                alertItem = AlertContext.computerWin
            }
        }
    }

}
