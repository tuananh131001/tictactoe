/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Tuan Anh
  ID: s3864077
  Created  date:20/08/2022
  Last modified: 28/08/2022
  Acknowledgement: Myself
*/
import SwiftUI

/*
  components for circle red in play view
*/
struct GameSquareView: View {
    var isRed: Bool
    var proxy: GeometryProxy
    var body: some View {
        Circle()
            .foregroundColor(isRed ? .red : .blue).opacity(0.5)
            .frame(width: proxy.size.width / 3 - 15, height: proxy.size.width / 3 - 15)
    }
}
