//
//  PlayerViewModel.swift
//  tictactoe
//
//  Created by William on 22/08/2022.
//

import SwiftUI
import Foundation

class PlayerViewModel: ObservableObject {
    @Published var players = [GamePlayer]()
    init() {
        self.players = DataService.getPlayerData()
    }

}

