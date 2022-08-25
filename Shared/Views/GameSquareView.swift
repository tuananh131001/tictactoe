//
//  GameSquareView.swift
//  tictactoe
//
//  Created by William on 25/08/2022.
//
import SwiftUI

struct GameSquareView: View {
    var proxy: GeometryProxy
    var body: some View {
        Circle()
            .foregroundColor(.red).opacity(0.5)
            .frame(width: proxy.size.width / 3 - 15, height: proxy.size.width / 3 - 15)
    }
}
