//
//  GamePlayerModel.swift
//  tictactoe
//
//  Created by William on 23/08/2022.
//

import Foundation

class GamePlayerModel: Identifiable {
    var id: UUID?
    var name: String
    var score: Int
    init(id: UUID,name: String,score: Int){
        self.id = id
        self.name = name
        self.score = score
    }
    
    
}
