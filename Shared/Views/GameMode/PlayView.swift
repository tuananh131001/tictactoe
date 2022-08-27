//
//  PlayView.swift
//  tictactoe
//
//  Created by William on 12/08/2022.
//

import SwiftUI


struct PlayView: View {
    @EnvironmentObject private var viewModel: PlayViewModel
    @State private var reachAchieve = ""
    @State private var presentAlert = false
    var body: some View {

        GeometryReader { geometry in
            VStack {
                reachAchieve != "" ? VStack {
                    Text("Congratulation 🎉").foregroundColor(.white).padding(10).background(.blue).cornerRadius(20)
                    Text("\(viewModel.currentPlayer.name) \(reachAchieve)")
                }: nil
                Spacer()
                HStack {
                    Text("My turn")
                        .fontWeight(.bold)
                        .foregroundColor(!viewModel.isGameBoardDisabled ? .white : .primary)
                        .padding(5)
                        .background(!viewModel.isGameBoardDisabled ? .red : Color(.systemBackground)).cornerRadius(20)
                    Spacer()
                    Text("Other turn")
                        .fontWeight(.bold)
                        .foregroundColor(viewModel.isGameBoardDisabled ? .white : .primary)
                        .padding(5)
                        .cornerRadius(20)
                        .background(viewModel.isGameBoardDisabled ? .red : Color(.systemBackground)).cornerRadius(20)
                }
                Spacer()
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(0..<9) { i in
                        ZStack {
                            // if no move ko x on that
                            GameSquareView(isRed: true, proxy: geometry)
                            PlayerIndicator(systemImageName: viewModel.game?.moves[i]?.indicator ?? "")
                        }
                            .onTapGesture {
                            reachAchieve = ""
                            viewModel.processPlayerMove(for: i)
                        }
                    }
                }
                Spacer()
                Menu("Select mode: \(viewModel.mode)") {
                    Button("Gacha mode", action: gachaMode)
                    Button("Easy mode", action: easyMode)
                    Button("Hard mode", action: hardMode)
                }
                Spacer()
                Text("Current Score: \(viewModel.currentPlayer.score)")
                Text("Player Name: \(viewModel.currentPlayer.name)")

                    .alert("You have left off", isPresented: $presentAlert, actions: {
                    Button("Resume", role: .destructive, action: { viewModel.retriveGameSave() })
                }, message: {
                        Text("Do you want to resume the game that you left off")
                    })
            }.padding()
                .disabled(viewModel.isGameBoardDisabled)
                .alert(item: $viewModel.alertItem, content: { alertItem in
                Alert(title: alertItem.title,
                    message: alertItem.message,
                    dismissButton: .default(alertItem.buttonTitle, action: { viewModel.resetGame() }))
            })
        }
            .onChange(of: viewModel.currentPlayer.score, perform: { newValue in
                checkAchieve(newValue:newValue)
        })
            .onAppear {
            if(viewModel.game == nil && viewModel.gameSave != nil) {
                viewModel.resetGameObject()
                presentAlert = true
            } else {
                viewModel.resetGameObject()
            }
            viewModel.mode = "easy"

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
    func checkAchieve(newValue:Int ){
        if (newValue == 1200) {
            reachAchieve = "has reached 1,200 score . You gets a 🥉"
            playSound(sound: "levelup", type: "mp3")
        }
        else if (newValue == 3000) {
            reachAchieve = "has reached 3,000 score . You gets a 🥈"
            playSound(sound: "levelup", type: "mp3")
        }
        else if (newValue == 4000) {
            reachAchieve = "has reached 4,000 score . You gets a 🥇"
            playSound(sound: "levelup", type: "mp3")
        }
        else if (newValue == 10000) {
            reachAchieve = "has reached 10,000 score . You gets a 💎"
            playSound(sound: "levelup", type: "mp3")
        }
        else if (newValue == 100000) {
            reachAchieve = "has reached 100,000 score . You gets a 👑"
            playSound(sound: "levelup", type: "mp3")
        }
        else if (newValue == 1000000) {
            reachAchieve = "has reached 1,000,000 score . You gets a 🏆"
            playSound(sound: "levelup", type: "mp3")
        }
    }

}
