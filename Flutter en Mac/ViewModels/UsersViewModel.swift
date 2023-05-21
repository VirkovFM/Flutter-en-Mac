import Foundation
import Combine
import FirebaseFirestore
 
class UsersViewModel: ObservableObject {
  @Published var Users = [users]()
   
  private var db = Firestore.firestore()
  private var listenerRegistration: ListenerRegistration?
   
  deinit {
    unsubscribe()
  }
   
  func unsubscribe() {
    if listenerRegistration != nil {
      listenerRegistration?.remove()
      listenerRegistration = nil
    }
  }
   
  func subscribe() {
    if listenerRegistration == nil {
      listenerRegistration = db.collection("users").addSnapshotListener { (querySnapshot, error) in
        guard let documents = querySnapshot?.documents else {
          print("No documents")
          return
        }
         
        self.Users = documents.compactMap { queryDocumentSnapshot in
          try? queryDocumentSnapshot.data(as: users.self)
        }
      }
    }
  }
   
  func removeMovies(atOffsets indexSet: IndexSet) {
    let Users = indexSet.lazy.map { self.Users[$0] }
    Users.forEach { user in
      if let documentId = user.id {
        db.collection("users").document(documentId).delete { error in
          if let error = error {
            print("Unable to remove document: \(error.localizedDescription)")
          }
        }
      }
    }
  }
 
   
}
