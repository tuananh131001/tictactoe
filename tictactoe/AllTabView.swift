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


// Tab View of all view with ablity to track tab item
struct AllTabView: View {
    @Binding var selectedTab:Int
    var body: some View {
        TabView(selection: $selectedTab) {
            TutorialView(tabSelection: $selectedTab)
                .tabItem {
                VStack {
                    Image(systemName: "book.fill")
                    Text("Guide")
                }
                }.tag(1)
            SelectView()
                .tabItem {
                VStack {
                    Image(systemName: "gamecontroller")
                    Text("Tic Tac Toe")
                }
            }.tag(2)
            LeaderBoardView()
                .tabItem {
                VStack {
                    Image(systemName: "list.bullet.indent")
                    Text("Leaderboard")
                }
            }.tag(3)
            SettingView()
                .tabItem {
                VStack {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            }.tag(4)
        }
    }
}
struct AllTabView_Previews: PreviewProvider {
    static var previews: some View {
        AllTabView(selectedTab: .constant(1))
    }
}
