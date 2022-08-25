//
//  Game.swift
//  tictactoe
//
//  Created by William on 25/08/2022.
//

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
