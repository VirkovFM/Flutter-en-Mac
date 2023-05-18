import Foundation
import Combine
import FirebaseFirestore
 
class UserViewModels: ObservableObject {
    
    @Published var user: User
    @Published var modified = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init(user: User = User(id: "", name: "", lastName: "", age: "", gender: "", email: "", password: "", rol: "")) {
        self.user = user
        
        self.$user
            .dropFirst()
            .sink { [weak self] user in
                self?.modified = true
            }
            .store(in: &self.cancellables)
    }
    
    // Firestore
    
    private var db = Firestore.firestore()
    
    private func addUser(_ user: User) {
        do {
            let _ = try db.collection("userlist").addDocument(from: user)
        }
        catch {
            print(error)
        }
    }
    
    private func updatUser(_ user: User) {
        if let documentId = user.id {
            do {
                try db.collection("userlist").document(documentId).setData(from: user)
            }
            catch {
                print(error)
            }
        }
    }
    
    private func createListUser(user: User) {
        do {
            let _ = try db.collection("userlist").addDocument(from: user)
        } catch {
            print(error)
        }
    }

    private func deleteUser(user: User) {
        if let documentId = user.id {
            db.collection("userlist").document(documentId).delete { error in
                if let error = error {
                    print("Error deleting document: \(error)")
                } else {
                    print("Document successfully deleted.")
                }
            }
        }
    }
    
}
