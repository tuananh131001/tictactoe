//
//  tictactoeApp.swift
//  tictactoe
//
//  Created by William on 12/08/2022.
//

import SwiftUI
import Firebase

@main
struct tictactoeApp: App {
    init(){
        // Use Firebase library to configure APIs
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            InitalView().environmentObject(PlayViewModel())
        }
    }
}
