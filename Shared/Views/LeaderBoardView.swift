//
//  LeaderBoardView.swift
//  tictactoe
//
//  Created by William on 12/08/2022.
//

import SwiftUI


struct LeaderBoardView: View {
    @EnvironmentObject private var viewModel: PlayViewModel

    var body: some View {
        VStack {
            List { ForEach(viewModel.listPlayer.sorted { $0.1 > $1.1 }, id: \.key) { key, value in
                    Section(header: Text(key)) {
                        HStack {
                            Text("\(value)")
                            if (value >= 1200) {
                                Text("🥉")
                            }
                            if (value >= 3000) {
                                Text("🥈")
                            }
                            if (value >= 4000) {
                                Text("🥇")
                            }
                            if (value >= 10000) {
                                Text("💎")
                            }
                            if (value >= 100000) {
                                Text("👑")
                            }
                            if (value >= 1000000) {
                                Text("🏆")
                            }
                        }

                    } }
            }

        }.onAppear(perform: {
            playSound(sound: "wii", type: "mp3")
        })



    }

}
