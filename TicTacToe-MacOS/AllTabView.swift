//
//  ContentView.swift
//  TicTacToe-MacOS
//
//  Created by William on 13/08/2022.
//

import SwiftUI

struct AllTabView: View {
//    var body: some View {
//        TabView {
//            TutorialView()
//                .tabItem {
//                VStack {
//                    Image(systemName: "book.fill")
//                    Text("Guide")
//                }
//            }
//
//            PlayView()
//                .tabItem {
//                VStack {
//                    Image(systemName: "gamecontroller")
//                    Text("Tic Tac Toe")
//                }
//            }.frame(width: 800, height: 800)
//            LeaderBoardView()
//                .tabItem {
//                VStack {
//                    Image(systemName: "list.bullet.indent")
//                    Text("Leaderboard")
//                }
//            }
//        } }
    @State var selectedTab = 1
    var body: some View {
        TabView(selection: $selectedTab) {
            TutorialView(tabSelection: $selectedTab)
                .tabItem {
                VStack {
                    Image(systemName: "book.fill")
                    Text("Guide")
                }
                }.tag(1)
            PlayView()
                .tabItem {
                VStack {
                    Image(systemName: "gamecontroller")
                    Text("Tic Tac Toe")
                }
            }.tag(2).frame(width: 800, height: 800)
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
        AllTabView()
    }
}
