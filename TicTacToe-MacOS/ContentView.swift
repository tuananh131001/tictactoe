//
//  ContentView.swift
//  TicTacToe-MacOS
//
//  Created by William on 13/08/2022.
//

import SwiftUI

struct ContentView: View {
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
            }.frame(width: 800, height: 800)
            LeaderBoardView()
                .tabItem {
                VStack {
                    Image(systemName: "list.bullet.indent")
                    Text("Leaderboard")
                }
            }
        } }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
