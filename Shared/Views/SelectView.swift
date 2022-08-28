/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Tuan Anh
  ID: s3864077
  Created  date:20/08/2022
  Last modified: 28/08/2022
  Acknowledgement: myself
*/
import SwiftUI

/*
  Where player can choose singleplayer or multiplayer
*/
struct SelectView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: PlayView()) {
                    Text("SinglePlayer 🙎🏿‍♂️").font(.title).foregroundColor(.white).padding().background(.blue).cornerRadius(20)
                }
                NavigationLink(destination: MultiplayerPlayView()) {
                    Text("Multiplayer 🙍🏻‍♀️ 💁‍♂️").font(.title).foregroundColor(.white).padding().background(.blue).cornerRadius(20)
                }
            }.background(Image("selectviewbg"))
        }.onAppear(perform: {
            playSound(sound: "selectview", type: "mp3")
            
        })
        

    }
}

struct SelectView_Previews: PreviewProvider {
    static var previews: some View {
        SelectView()
    }
}
