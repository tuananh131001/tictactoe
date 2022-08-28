/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Tuan Anh
  ID: s3864077
  Created  date:20/08/2022
  Last modified: 28/08/2022
  Acknowledgement:https://www.youtube.com/watch?v=jKbsWw9yAnI
  There is some warning here due to FirebaseFirestoreSwifthttps://stackoverflow.com/questions/62270746/cannot-convert-value-of-type-x-to-expected-argument-type-string-any
  Go to other view it will gone , the build will works without any error, game still play with no error
 */

import Foundation
import Firebase
import FirebaseFirestoreSwift
import Combine

final class FirebaseService: ObservableObject {
    static let shared = FirebaseService()
    @Published var game: Game!

    init() { }
    func createOnlineGame() {
        do {
            try FirebaseReference(.Game).document(self.game.id).setData(from: self.game)
        } catch {
            print("Error creating online game", error.localizedDescription)
        }
    }
    func startGame(with userId: String) {
        //check if there is a game to join, if no, we create new game. If yes, we will join and start listening for any changes in the game

        FirebaseReference(.Game).whereField("player2Id", isEqualTo: "").whereField("player1Id", isNotEqualTo: userId).getDocuments { querySnapshot, error in

            if error != nil {
                print("Error starting game", error?.localizedDescription ?? "Uncatch error")
                //create new game
                self.createNewGame(with: userId)
                return
            }

            if let gameData = querySnapshot?.documents.first {
                self.game = try? gameData.data(as: Game.self)
                self.game.player2Id = userId
                self.game.blockMoveForPlayerId = userId

                self.updateGame(self.game)
                self.listenForGameChanges()
            } else {
                self.createNewGame(with: userId)
            }
        }
    }
    func createNewGame(with userId: String) {
        //create new game object
        print("creating game for userid", userId)
        print(userId)
        self.game = Game(id: UUID().uuidString, player1Id: userId, player2Id: "", blockMoveForPlayerId: userId, winningPlayerId: "", rematchPlayerId: [], moves: Array(repeating: nil, count: 9))
        self.createOnlineGame()
        self.listenForGameChanges()
    }
    func listenForGameChanges() {
        FirebaseReference(.Game).document(self.game.id).addSnapshotListener { documentSnapshot, error in
            print("changes received from firebase")

            if error != nil {
                print("Error listening to changes", error?.localizedDescription ?? "Uncatch error")
                return
            }

            if let snapshot = documentSnapshot {
                self.game = try? snapshot.data(as: Game.self)
            }
        }
    }

    func updateGame(_ game: Game) {
        do {
            try FirebaseReference(.Game).document(game.id).setData(from: game)
        } catch {
            print("Error updating online game", error.localizedDescription)
        }
    }

    func quitTheGame() {
        guard game != nil else { return }
        FirebaseReference(.Game).document(self.game.id).delete()
    }
}
