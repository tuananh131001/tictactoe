//
//  PlayView.swift
//  tictactoe
//
//  Created by William on 12/08/2022.
//

import SwiftUI


struct MultiplayerPlayView: View {
    @EnvironmentObject private var viewModel: PlayViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
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
                Text(viewModel.gameNotification)
                Text("Current Score: \(viewModel.currentPlayer.score)")
                Text("Player Name: \(viewModel.currentPlayer.name)")
            }.padding()
                .disabled(viewModel.checkForGameBoardStatus())
                .alert(item: $viewModel.alertItem, content: { alertItem in
                alertItem.isForQuit ? Alert(title: alertItem.title, message: alertItem.message, dismissButton: .destructive(alertItem.buttonTitle, action: {
                    self.mode.wrappedValue.dismiss()
                    viewModel.quitGame()
                }))
                : Alert(title: alertItem.title, message: alertItem.message, primaryButton: .default(alertItem.buttonTitle, action: {
                    viewModel.resetGame()
                }), secondaryButton: .destructive(Text("Quit"), action: {
                            self.mode.wrappedValue.dismiss()
                            viewModel.quitGame()
                        }))
            })
        }.onAppear {
            viewModel.mode = "multiplayer"
            viewModel.getTheGame()
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





struct MultiplayerPlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}
