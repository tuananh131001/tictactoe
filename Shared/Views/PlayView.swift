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
                            PlayerIndicator(systemImageName: viewModel.moves[i]?.indicator ?? "")
                        }.onTapGesture {
                            viewModel.processPlayerMove(for: i)
                        }
                    }
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
        }
    }

}

enum Player {
    case human, computer
}
struct Move {
    let player: Player
    let boardIndex: Int
    // if player is x , ai is circle
    var indicator: String {
        return player == .human ? "xmark" : "circle"
    }
}
struct GameSquareView: View {
    var proxy: GeometryProxy
    var body: some View {
        Circle()
            .foregroundColor(.red).opacity(0.5)
            .frame(width: proxy.size.width / 3 - 15, height: proxy.size.width / 3 - 15)
    }
}


struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}

struct PlayerIndicator: View {
    var systemImageName: String
    @State private var degrees = 0.0
    var body: some View {
        ZStack {
            
            Image(systemName: systemImageName)
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.white)

        }.rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 1, z: 0))
            .onChange(of: systemImageName, perform: { newValue in
            withAnimation(.easeIn(duration: 0.25)) {
                self.degrees -= 180
            }
        })



//            .animation(.easeIn(duration: 0.25), value: i) {
//            degrees -= 180
//        }
//        withAnimation(.easeIn(duration: 0.25)) {
//            degrees -= 180
//        }

    }
}
