//
//  InitalView.swift
//  tictactoe
//
//  Created by William on 23/08/2022.
//

import SwiftUI

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
