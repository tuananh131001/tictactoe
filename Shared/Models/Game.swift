/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Tuan Anh
  ID: s3864077
  Created  date: 26/08/2022
  Last modified: 28/08/2022
  Acknowledgement:https://www.youtube.com/watch?v=jKbsWw9yAnI
 
*/
import Foundation

struct Game :Codable {
    let id: String
    var player1Id: String
    var player2Id: String

    var blockMoveForPlayerId: String
    var winningPlayerId: String
    var rematchPlayerId: [String]

    var moves: [Move?]
}
