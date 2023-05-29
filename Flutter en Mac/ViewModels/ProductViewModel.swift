import Foundation
import Combine
import FirebaseFirestore
 
class ProductViewModels: ObservableObject {
    
    @Published var product: Product
    @Published var modified = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init(product: Product = Product(id: "", ID: "", Name: "", Description: "", Category: "", Gender: "", Types: "", Units: "", Price: "", TotalFinal: "")) {
        self.product = product
        
        self.$product
            .dropFirst()
            .sink { [weak self] user in
                self?.modified = true
            }
            .store(in: &self.cancellables)
    }
    
    // Firestore
    
    private var db = Firestore.firestore()
    
    private func addProduct(_ product: Product) {
        do {
            let _ = try db.collection("products").addDocument(from: product)
        }
        catch {
            print(error)
        }
    }
    
    private func updateProduct(_ product: Product) {
        if let documentId = product.id {
            do {
                try db.collection("products").document(documentId).setData(from: product)
            }
            catch {
                print(error)
            }
        }
    }
    
   private func updateOrAddProduct() {
     if let _ = product.id {
       self.updateProduct(self.product)
     }
     else {
       addProduct(product)
     }
   }
    
   private func removeProduct() {
     if let documentId = product.id {
       db.collection("products").document(documentId).delete { error in
         if let error = error {
           print(error.localizedDescription)
         }
       }
     }
   }
    
   // UI handlers
    
   func handleDoneTapped() {
     self.updateOrAddProduct()
   }
    
   func handleDeleteTapped() {
     self.removeProduct()
   }
    
    
}
