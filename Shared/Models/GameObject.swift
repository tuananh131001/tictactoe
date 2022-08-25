//
//  GameObject.swift
//  tictactoe
//
//  Created by William on 25/08/2022.
//

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

