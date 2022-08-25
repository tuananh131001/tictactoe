//
//  PlayerIndicator.swift
//  tictactoe
//
//  Created by William on 25/08/2022.
//

import SwiftUI

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
    }
}
