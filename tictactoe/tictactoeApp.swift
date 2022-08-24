//
//  tictactoeApp.swift
//  tictactoe
//
//  Created by William on 12/08/2022.
//

import SwiftUI

@main
struct tictactoeApp: App {
    
    var body: some Scene {
        WindowGroup {
            InitalView().environmentObject(PlayViewModel())
        }
    }
}
