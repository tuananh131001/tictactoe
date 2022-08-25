//
//  GameNotification.swift
//  tictactoe
//
//  Created by William on 25/08/2022.
//

import SwiftUI

enum GameState {
    case started
    case waitingForPlayer
    case finished
}


struct GameNotification {
    static let waitingForPlayer = "Waiting for player"
    static let gameHasStarted = "Game has started"
    static let gameFinished = "Player left the game"
}
