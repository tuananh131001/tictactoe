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

    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    // left to right 0 to 3
    @Published var moves: [Move?] = Array(repeating: nil, count: 9)
    @Published var isGameBoardDisabled = false
    @Published var alertItem: AlertItem?
    @Published var currentPlayer: GamePlayerModel = UserDefaults.standard.object(forKey: "currentPlayer") as? GamePlayerModel ?? GamePlayerModel(id: UUID(), name: "sir", score: 1000)
    @Published var listPlayer: [String:Int] = UserDefaults.standard.object(forKey: "players") as? [String: Int] ?? [:]
    private var cancellable: AnyCancellable?



    func processPlayerMove(for position: Int) {
        if isSpareOccupied(in: moves, forIndex: position) { return }
        moves[position] = Move(player: .human, boardIndex: position)
//                            isHumansTurn.toggle()
        if checkWinCondition(for: .human, in: moves) {
            alertItem = AlertContext.humanWin
            currentPlayer.score += 200
//            addCourse()
            return
        }
        if checkForDraw(in: moves) {
            alertItem = AlertContext.draw
            return
        }
        isGameBoardDisabled = true
        // check for win or draw
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            let computerPosition = computerMoveLocation(in: moves)
            moves[computerPosition] = Move(player: .computer, boardIndex: computerPosition)
            isGameBoardDisabled = false
            if checkWinCondition(for: .computer, in: moves) {
                alertItem = AlertContext.computerWin
                currentPlayer.score -= 200

                listPlayer[currentPlayer.name] = currentPlayer.score
                UserDefaults.standard.set(listPlayer, forKey: "players")
                return
            }
            if checkForDraw(in: moves) {
                alertItem = AlertContext.draw
                return
            }
        }
    }
    // Check already exist
    func isSpareOccupied(in moves: [Move?], forIndex index: Int) -> Bool {
        return moves.contains(where: { $0?.boardIndex == index })
    }
    // If Ai can win then win
    // If AI cant win , then block
    // If AI cant block, then take middlespare
    func computerMoveLocation(in moves: [Move?]) -> Int {
        // If Ai can win then win
        let winPatterns: Set<Set<Int>> = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
        let computerMoves = moves.compactMap { $0 }.filter { $0.player == .computer }
        let computerPosition = Set(computerMoves.map { $0.boardIndex })

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
    func checkForDraw(in moves: [Move?]) -> Bool {
        return moves.compactMap { $0 }.count == 9
    }
    func resetGame() {
        moves = Array(repeating: nil, count: 9)
    }
}
