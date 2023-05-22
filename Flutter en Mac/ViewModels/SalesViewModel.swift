import Foundation
import Combine
import FirebaseFirestore
 
class SalesViewModel: ObservableObject {
  @Published var Sales = [Sale]()
   
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
      listenerRegistration = db.collection("sales").addSnapshotListener { (querySnapshot, error) in
        guard let documents = querySnapshot?.documents else {
          print("No documents")
          return
        }
         
        self.Sales = documents.compactMap { queryDocumentSnapshot in
          try? queryDocumentSnapshot.data(as: Sale.self)
        }
      }
    }
  }
   
  func removeMovies(atOffsets indexSet: IndexSet) {
    let Sales = indexSet.lazy.map { self.Sales[$0] }
    Sales.forEach { sale in
      if let documentId = sale.id {
        db.collection("sales").document(documentId).delete { error in
          if let error = error {
            print("Unable to remove document: \(error.localizedDescription)")
          }
        }
      }
    }
  }
 
   
}
