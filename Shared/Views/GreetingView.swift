//
//  WelcomeView.swift
//  tictactoe
//
//  Created by William on 23/08/2022.
//

import SwiftUI

struct GreetingView: View {
    @Binding var active: Bool
    @Binding var selectedTab: Int
    @EnvironmentObject private var viewModel: PlayViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            // Title
            VStack(spacing: 0) {
                Text("Tic Tae Toe")
                    .font(.system(size: 60))
                    .fontWeight(.heavy)
                    .foregroundColor(.orange)
                Text("""
                        "Do stupid stuff,
                        But do it with confidence"
                        - Robin "Flusha" Ronnquist
                        """)
                    .font(.subheadline)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
            }
            // Name Setting
            HStack {
                Text("Name(default: Tom):")
                TextField("Type your name", text: $viewModel.currentPlayer.name).padding(.horizontal).frame(height: 60).cornerRadius(50)
            }.padding()
            Spacer()
            // Tutorial
            Button(action: {
                // Click button lets roll will play theme music
                active = false
                selectedTab = 1
            }, label: {
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                        .frame(height: 80)
                        .overlay(Text("How to play")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold))
                })
            // Game
            Button(action: {
                // Click button lets roll will play theme music
                active = false
                selectedTab = 2
            }, label: {
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                        .frame(height: 80)
                        .overlay(Text("Play Game")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold))
                })
            // Leaderboard
            Button(action: {
                // Click button lets roll will play theme music
                active = false
                selectedTab = 3
            }, label: {
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                        .frame(height: 80)
                        .overlay(Text("Leaderboard")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold))
                })
        }

    }
}

struct GreetingView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingView(active: .constant(true), selectedTab: .constant(1))
    }
}
