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
