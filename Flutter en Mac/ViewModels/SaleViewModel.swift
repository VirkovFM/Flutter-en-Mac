import Foundation
import Combine
import FirebaseFirestore
 
class SaleViewModels: ObservableObject {
    
    @Published var sale: Sale
    @Published var modified = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init(sale: Sale = Sale(id: "", name: "", cant: "", idProduct: "", idClient: "", pieces: "", subtotal: "", total: "")) {
        self.sale = sale
        
        self.$sale
            .dropFirst()
            .sink { [weak self] sale in
                self?.modified = true
            }
            .store(in: &self.cancellables)
    }
    
    // Firestore
    
    private var db = Firestore.firestore()
    
    private func addSale(_ sale: Sale) {
        do {
            let _ = try db.collection("salelist").addDocument(from: sale)
        }
        catch {
            print(error)
        }
    }
    
    private func updateSale(_ sale: Sale) {
        if let documentId = sale.id {
            do {
                try db.collection("salelist").document(documentId).setData(from: sale)
            }
            catch {
                print(error)
            }
        }
    }
    
    private func createListSale(sale: Sale) {
        do {
            let _ = try db.collection("salelist").addDocument(from: sale)
        } catch {
            print(error)
        }
    }

    private func deleteSale(sale: Sale) {
        if let documentId = sale.id {
            db.collection("salelist").document(documentId).delete { error in
                if let error = error {
                    print("Error deleting document: \(error)")
                } else {
                    print("Document successfully deleted.")
                }
            }
        }
    }
}
