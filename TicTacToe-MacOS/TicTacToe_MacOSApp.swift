//
//  TicTacToe_MacOSApp.swift
//  TicTacToe-MacOS
//
//  Created by William on 13/08/2022.
//

import SwiftUI

@main
struct TicTacToe_MacOSApp: App {
    var body: some Scene {
        WindowGroup {
            InitalView().environmentObject(PlayViewModel())
        }
    }
}
