//
//  SettingView.swift
//  tictactoe
//
//  Created by William on 23/08/2022.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject private var viewModel: PlayViewModel
    var body: some View {

        Form {
            HStack {
                Text("Name:")
                TextField("Type your name", text: $viewModel.currentPlayer.name).padding(.horizontal).frame(height: 60).cornerRadius(50)
            }
        }

    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
