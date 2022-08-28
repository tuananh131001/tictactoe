/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Tuan Anh
  ID: s3864077
  Created  date:20/08/2022
  Last modified: 28/08/2022
  Acknowledgement:
*/
import SwiftUI

struct TutorialView: View {
    @Binding var tabSelection: Int
    var body: some View {
        ScrollView {
            VStack(alignment: .center,spacing: 10) {
                
                Text("The goal of the game is to connect number symbols indicated on the upper panel")
                Image("threewin").resizable().frame(width: 100, height: 40)
                Text("You can connect symbols in any direction row, column or diagonal")
                Text("Some winning examples")
                    .font(.title2).fontWeight(.bold).foregroundColor(.blue)
                HStack {
                    Image("horizontalwin").resizable().scaledToFit()
                    Image("columnwin").resizable().scaledToFit()
                }

                HStack {
                    Image("leftdiagonalwin").resizable().scaledToFit()
                    Image("rightdiagonalwin").resizable().scaledToFit()
                }
                Text("Score System")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                VStack(alignment:.leading) {
                    Text("You get start with 1000 score 💸")
                    Text("You will get 200 score for winning 🎖")
                    Text("You will lose 200 score for losing 🥲")
                }
                Button(action: {
                    // Click button lets roll will play theme music
                    self.tabSelection = 2
                }, label: {
                        Capsule()
                            .fill(Color.red.opacity(0.2))
                            .padding(8)
                            .frame(height: 80)
                            .overlay(Text("Let's start")
                                .font(.system(.title3, design: .rounded))
                                .fontWeight(.heavy)
                                .foregroundColor(.red))
                    })
            }.padding().onAppear(perform: {
                playSound(sound: "tutorialmusic", type: "mp3")
            })
        }
    }
}

struct Tutorial_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView(tabSelection: .constant(1))
    }
}
