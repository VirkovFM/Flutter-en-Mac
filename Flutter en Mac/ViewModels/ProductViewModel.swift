import Foundation
import Combine
import FirebaseFirestore
 
class ProductViewModels: ObservableObject {
    
    @Published var product: Product
    @Published var modified = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init(product: Product = Product(id: "", name: "", description: "", unit: "", cost: "", price: "", utility: "")) {
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
            let _ = try db.collection("productlist").addDocument(from: product)
        }
        catch {
            print(error)
        }
    }
    
    private func updateProduct(_ product: Product) {
        if let documentId = product.id {
            do {
                try db.collection("productlist").document(documentId).setData(from: product)
            }
            catch {
                print(error)
            }
        }
    }
    
    private func createListProduct(product: Product) {
        do {
            let _ = try db.collection("productlist").addDocument(from: product)
        } catch {
            print(error)
        }
    }

    private func deleteProduct(product: Product) {
        if let documentId = product.id {
            db.collection("productlist").document(documentId).delete { error in
                if let error = error {
                    print("Error deleting document: \(error)")
                } else {
                    print("Document successfully deleted.")
                }
            }
        }
    }
}
