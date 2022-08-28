/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Tuan Anh
  ID: s3864077
  Created  date: 26/08/2022
  Last modified: 28/08/2022
  Acknowledgement:
*/
import SwiftUI

@main
struct tictactoeApp: App {
    var body: some Scene {
        WindowGroup {
            InitalView().environmentObject(PlayViewModel())
        }
    }
}
