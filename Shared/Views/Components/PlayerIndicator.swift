/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Tuan Anh
  ID: s3864077
  Created  date:20/08/2022
  Last modified: 28/08/2022
  Acknowledgement: hackingwithswift
*/

import SwiftUI

/*
  The X and O indicator with 3D animations
*/
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
