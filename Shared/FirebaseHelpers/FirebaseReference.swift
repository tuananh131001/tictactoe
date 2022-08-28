/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Tuan Anh
  ID: s3864077
  Created  date:20/08/2022
  Last modified: 28/08/2022
  Acknowledgement:https://www.youtube.com/watch?v=jKbsWw9yAnI
*/
import Firebase

enum FCollectionReference: String {
    case Game
}


func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference {
    return Firestore.firestore().collection(collectionReference.rawValue)
}
