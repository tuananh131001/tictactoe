//
//  PlayView.swift
//  tictactoe
//
//  Created by William on 12/08/2022.
//

import SwiftUI
import Firebase

struct MultiplayerPlayView: View {
    init(){
        // Use Firebase library to configure APIs
        FirebaseApp.configure()
    }
    @EnvironmentObject private var viewModel: PlayViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {

        GeometryReader { geometry in
            VStack {
                Text(viewModel.gameNotification)
                Spacer()
                HStack {
                    Text("My turn").foregroundColor(viewModel.game?.blockMoveForPlayerId != viewModel.currentUser.id ? .red : .primary)
                    Spacer()
                    Text("Other turn").foregroundColor(viewModel.game?.blockMoveForPlayerId == viewModel.currentUser.id ? .red : .primary)
                }
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(0..<9) { i in
                        ZStack {
                            // if no move ko x on that
                            GameSquareView(isRed: false, proxy: geometry)
                            PlayerIndicator(systemImageName: viewModel.game?.moves[i]?.indicator ?? "")
                        }.onTapGesture {
                            viewModel.processPlayerMove(for: i)
                        }
                    }
                }
                Spacer()
                Text("Select mode: \(viewModel.mode)")
                Spacer()

                Text("Your ID: \(viewModel.currentUser.id)")
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
            viewModel.resetGameObject()
            viewModel.mode = "multiplayer"
            viewModel.getTheGame()
        }.navigationBarBackButtonHidden(true)
            .navigationBarItems(
            leading:
                Button(action: {
                mode.wrappedValue.dismiss()
                viewModel.quitGame()
            }) {
                Text("Back")
            }
        )
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
