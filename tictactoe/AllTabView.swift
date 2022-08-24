//
//  ContentView.swift
//  tictactoe
//
//  Created by William on 12/08/2022.
//

import SwiftUI

struct AllTabView: View {
    
    var body: some View {
        TabView {
            TutorialView()
                .tabItem {
                VStack {
                    Image(systemName: "book.fill")
                    Text("Guide")
                }
            }

            PlayView()
                .tabItem {
                VStack {
                    Image(systemName: "gamecontroller")
                    Text("Tic Tac Toe")
                }
            }
            LeaderBoardView()
                .tabItem {
                VStack {
                    Image(systemName: "list.bullet.indent")
                    Text("Leaderboard")
                }
            }
            SettingView()
                .tabItem {
                VStack {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            }
        }.environmentObject(PlayViewModel())
    }
}
struct AllTabView_Previews: PreviewProvider {
    static var previews: some View {
        AllTabView()
    }
}
