//
//  AlertItem.swift
//  tictactoe
//
//  Created by William on 13/08/2022.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var isForQuit = false
    var title: Text
    var message: Text
    var buttonTitle: Text
}
struct AlertContext {
    static let humanWin = AlertItem(title: Text("You Win!"), message: Text("Clever boi. You beat the machine"), buttonTitle: Text("Nice"))
    static let computerWin = AlertItem(title: Text("You Lost"), message: Text("Try better next time"), buttonTitle: Text("Rematch"))
    static let draw = AlertItem(title: Text("Draw"), message: Text("Pretty Close"), buttonTitle: Text("Try Again"))
    static let quit = AlertItem(isForQuit: true, title: Text("GameOver"), message: Text("Other player left."), buttonTitle: Text("Quit"))
}
