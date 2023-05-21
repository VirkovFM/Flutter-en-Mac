/*import SwiftUI
//import SDWebImageSwiftUI
 
struct UserListView: View {
    
   
  @Environment(\.presentationMode) var presentationMode
  @State var presentEditBookSheet = false
   
   
  var user: users
   
  private func editButton(action: @escaping () -> Void) -> some View {
    Button(action: { action() }) {
        Image(systemName: "square.and.pencil").font(.system(size: 20.0)).fontWeight(.bold)
    }.foregroundColor(Color.black)
  }
   
  var body: some View {
      
    Form {
             
        Section(header: Text("ID")) {
                     Text(user.ID)
                     Text(user.Email)
                      
                 }
                  
                 Section(header: Text("Name")) {
                     Text(user.Name)
                 }
    }
    .navigationBarTitle(user.Name)
    .navigationBarItems(trailing: editButton {
      self.presentEditBookSheet.toggle()
    })
    .onAppear() {
      print("BookDetailsView.onAppear() for \(self.user.Name)")
    }
    .onDisappear() {
      print("BookDetailsView.onDisappear()")
    }
    .sheet(isPresented: self.$presentEditBookSheet) {
        RegisterView(viewModel: UserViewModels(user: user), mode: .edit) { result in
        if case .success(let action) = result, action == .delete {
          self.presentationMode.wrappedValue.dismiss()
        }
      }
    }
  }
}*/

 
struct UsersListView_Previews: PreviewProvider {
     static var previews: some View {
         let user = users(ID: "1", Name: "", LastName: "", Age: "", Gender: "", Email: "", Password: "")
         return
           NavigationView {
         UserListView(user: user)
           }
     }
 }
