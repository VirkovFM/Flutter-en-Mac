import Foundation
import Combine
import FirebaseFirestore
import FirebaseAuth
 
class UserViewModels: ObservableObject {
    
    @Published var user: users
    @Published var modified = false
    
    
    private var cancellables = Set<AnyCancellable>()
    
    init(user: users = users(id: "", ID: "", Name: "", LastName: "", Age: "", Gender: "", Email: "", Password: "")) {
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
    
    private func addUser(_ user: users) {
        do {
            let _ = try db.collection("users").addDocument(from: user)
            
            Auth.auth().createUser(withEmail: user.Email, password: user.Password) { [weak self] authResult, error in
                guard let self = self else { return }
                
                if let error = error {
                    print("Error al crear el usuario: \(error.localizedDescription)")
                } else {
                    print("Usuario creado exitosamente")
                    
                    // Actualizar el ID del usuario con el ID proporcionado por Firebase Authentication
                    self.user.ID = authResult?.user.uid ?? ""
                    self.updateUser(self.user)
                }
            }
        }
        catch {
            print(error)
        }
    }
    
    private func updateUser(_ user: users) {
        if let documentId = user.id {
            do {
                try db.collection("users").document(documentId).setData(from: user)
            }
            catch {
                print(error)
            }
        }
    }
    
    private func updateOrAddUser() {
      if let _ = user.id {
        self.updateUser(self.user)
      }
      else {
        addUser(user)
      }
    }
     
    private func removeUser() {
      if let documentId = user.id {
        db.collection("users").document(documentId).delete { error in
          if let error = error {
            print(error.localizedDescription)
          }
        }
      }
    }
     
    // UI handlers
     
    func handleDoneTapped() {
      self.updateOrAddUser()
    }
     
    func handleDeleteTapped() {
      self.removeUser()
    }
}
