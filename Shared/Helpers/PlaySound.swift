/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Tuan Anh
  ID: s3864077
  Created  date: 26/08/2022
  Last modified: 28/08/2022
  Acknowledgement:https://www.youtube.com/watch?v=6l5nJgrXTfc
 
*/
import AVFoundation

var audioPlayer: AVAudioPlayer?

// Utility for playing music
func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("ERROR: Could not find and play the sound file!")
        }
    }
}
