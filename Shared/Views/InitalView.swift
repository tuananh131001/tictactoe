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
  Display greeting view for navigation to different views
*/
struct InitalView: View {
    @State var isWelcomeActive: Bool = true
    @State var selectedTab = 1
      var body: some View {
          ZStack {
              if isWelcomeActive {
                  GreetingView(active: $isWelcomeActive,selectedTab:$selectedTab)
              } else {
                  AllTabView(selectedTab:$selectedTab)
              }
          }
      }
}

struct InitalView_Previews: PreviewProvider {
    static var previews: some View {
        InitalView()
    }
}
