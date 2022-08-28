/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Tuan Anh
  ID: s3864077
  Created  date: 26/08/2022
  Last modified: 28/08/2022
  Acknowledgement:https://www.youtube.com/watch?v=jKbsWw9yAnI
 
*/

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
