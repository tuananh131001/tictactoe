//
//  Tutorial.swift
//  tictactoe
//
//  Created by William on 12/08/2022.
//

import SwiftUI

struct TutorialView: View {
    @Binding var tabSelection: Int
    var body: some View {
        VStack {
            Text("You will get start with 1000$")
            Text("The goal of the game is to connect number symbols indicated on the upper panel")
            Image("threewin").resizable().scaledToFit()
            Text("You can connect symbols in any direction row, column or diagonal")
            Image("horizontalwin").resizable().scaledToFit()
            Image("columnwin").resizable().scaledToFit()
            HStack {
                Image("leftdiagonalwin").resizable().scaledToFit()
                Image("rightdiagonalwin").resizable().scaledToFit()
            }
            Button(action: {
                // Click button lets roll will play theme music
                self.tabSelection = 2
            }, label: {
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                        .frame(height: 80)
                        .overlay(Text("Let's start")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.blue))
                })
        }.padding()
    }
}

//struct Tutorial_Previews: PreviewProvider {
//    static var previews: some View {
//        TutorialView(tabSelection: )
//    }
//}
