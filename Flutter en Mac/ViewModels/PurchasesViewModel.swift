import Foundation
import Combine
import FirebaseFirestore
 
class PurchasesViewModel: ObservableObject {
  @Published var Purchases = [Purchase]()
   
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
      listenerRegistration = db.collection("purchase").addSnapshotListener { (querySnapshot, error) in
        guard let documents = querySnapshot?.documents else {
          print("No documents")
          return
        }
         
        self.Purchases = documents.compactMap { queryDocumentSnapshot in
          try? queryDocumentSnapshot.data(as: Purchase.self)
        }
      }
    }
  }
   
  func removeMovies(atOffsets indexSet: IndexSet) {
    let Purchases = indexSet.lazy.map { self.Purchases[$0] }
    Purchases.forEach { purchase in
      if let documentId = purchase.id {
        db.collection("purchase").document(documentId).delete { error in
          if let error = error {
            print("Unable to remove document: \(error.localizedDescription)")
          }
        }
      }
    }
  }
 
   
}
