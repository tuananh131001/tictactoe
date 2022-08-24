/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 1
  Author: Nguyen Tuan Anh
  ID: s3864077
  Created  date: 26/07/2022
  Last modified: 28/07/2022
  Acknowledgement:
    
 
*/
import Foundation

/*
    Service class for parsing data from json
*/
class DataService {
    static func getPlayerData() -> [GamePlayer] {
        let pathString = Bundle.main.path(forResource: "playerData", ofType: "json")
        if let path = pathString {
            // Create a url object
            let url = URL(fileURLWithPath: path)
            //Error handling
            do {
                let data = try Data(contentsOf: url)
                //Parse the data
                let decoder = JSONDecoder()
                do {
                    let players = try decoder.decode([GamePlayer].self, from: data)
                    for p in players {
                        p.id = UUID()
                    }
                    return players
                } catch {
                    print(error)
                }
            }
            catch {
                // execution will come here if an error is thrown
                print(error)
            }

        }
        return [GamePlayer]()
    }

}
