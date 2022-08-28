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
import AVFoundation

/*
  Where player can change their name for display in leaderboard
*/
struct SettingView: View {
    @EnvironmentObject private var viewModel: PlayViewModel
    var body: some View {
        VStack {
            Form {
                HStack {
                    Text("Change Your Name:")
                    TextField("Type your name", text: $viewModel.currentPlayer.name).padding(.horizontal).frame(height: 60).cornerRadius(50)
                }
            }

        }

    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
