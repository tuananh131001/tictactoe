//
//  ContentView.swift
//  tictactoe
//
//  Created by William on 12/08/2022.
//

import SwiftUI

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
        }.onChange(of: selectedTab) { newValue in
//            playSound(sound: "press", type: "mp3")
        }
    }
}
struct AllTabView_Previews: PreviewProvider {
    static var previews: some View {
        AllTabView(selectedTab: .constant(1))
    }
}
