import Foundation
import Combine
import FirebaseFirestore
 
class PurchaseViewModels: ObservableObject {
    
    @Published var purchase: Purchase
    @Published var modified = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init(purchase: Purchase = Purchase(id: "", name: "", pieces: "", idAdmin: "")) {
        self.purchase = purchase
        
        self.$purchase
            .dropFirst()
            .sink { [weak self] purchase in
                self?.modified = true
            }
            .store(in: &self.cancellables)
    }
    
    // Firestore
    
    private var db = Firestore.firestore()
    
    private func addMovie(_ purchase: Purchase) {
        do {
            let _ = try db.collection("purchaselist").addDocument(from: purchase)
        }
        catch {
            print(error)
        }
    }
    
    private func updateMovie(_ purchase: Purchase) {
        if let documentId = purchase.id {
            do {
                try db.collection("purchaselist").document(documentId).setData(from: purchase)
            }
            catch {
                print(error)
            }
        }
    }
}
