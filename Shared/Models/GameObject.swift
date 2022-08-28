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
enum Player: Codable {
    case human, computer
}

struct Move: Codable {
    let player: Player
    let boardIndex: Int
    // if player is x , ai is circle
    var indicator: String {
        return player == .human ? "xmark" : "circle"
    }
}

