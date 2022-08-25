//
//  SelectView.swift
//  tictactoe
//
//  Created by William on 25/08/2022.
//

import SwiftUI

struct SelectView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: PlayView()) {
                    Text("SinglePlayer").font(.title).foregroundColor(.white).padding().background(.blue).cornerRadius(20)
                }
                NavigationLink(destination: MultiplayerPlayView()) {
                    Text("Multiplayer").font(.title).foregroundColor(.white).padding().background(.blue).cornerRadius(20)
                }
            }
        }
    }
}

struct SelectView_Previews: PreviewProvider {
    static var previews: some View {
        SelectView()
    }
}
