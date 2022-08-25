//
//  PlayView.swift
//  tictactoe
//
//  Created by William on 12/08/2022.
//

import SwiftUI


struct PlayView: View {
    @EnvironmentObject private var viewModel: PlayViewModel

    var body: some View {

        GeometryReader { geometry in
            VStack {
                Spacer()
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(0..<9) { i in
                        ZStack {
                            // if no move ko x on that
                            GameSquareView(proxy: geometry)
                            PlayerIndicator(systemImageName: viewModel.game?.moves[i]?.indicator ?? "")
                        }.onTapGesture {
                            viewModel.processPlayerMove(for: i)
                        }
                    }
                }
                Spacer()
                Menu("Select mode: \(viewModel.mode)") {
                    Button("Easy mode", action: easyMode)
                    Button("Hard mode", action: hardMode)
                    Button("Gacha mode", action: gachaMode)
                }
                Spacer()
                Text("Current Score: \(viewModel.currentPlayer.score)")
                Text("Player Name: \(viewModel.currentPlayer.name)")
            }.padding()
                .disabled(viewModel.isGameBoardDisabled)
                .alert(item: $viewModel.alertItem, content: { alertItem in
                Alert(title: alertItem.title,
                    message: alertItem.message,
                    dismissButton: .default(alertItem.buttonTitle, action: { viewModel.resetGame() }))
            })
        }.onAppear {
            viewModel.mode = "singleplayer"
        }
    }
    func easyMode() {
        viewModel.mode = "easy"
    }
    func hardMode() {
        viewModel.mode = "hard"
    }
    func gachaMode() {
        viewModel.mode = "gacha"
    }

}
