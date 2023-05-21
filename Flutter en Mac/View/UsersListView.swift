import SwiftUI



 struct UsersListView: View {
     @Environment(\.presentationMode) var presentationMode
     @State var presentEditUserSheet = false
      
     var user: users
      
     private func editButton(action: @escaping () -> Void) -> some View {
       Button(action: { action() }) {
         Text("Edit")
       }
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
       .navigationBarTitle(user.ID)
       .navigationBarItems(trailing: editButton {
         self.presentEditUserSheet.toggle()
       })
       .onAppear() {
           print("UsersListView.onAppear() for \(self.user.Name)")
       }
       .onDisappear() {
         print("UsersListView.onDisappear()")
       }
       .sheet(isPresented: self.$presentEditUserSheet) {
         RegisterView(viewModel: UserViewModels(user: user), mode: .edit) { result in
           if case .success(let action) = result, action == .delete {
             self.presentationMode.wrappedValue.dismiss()
           }
         }
       }
     }
      
   }
  
 struct UsersListView_Previews: PreviewProvider {
     static var previews: some View {
         let user = users(ID: "1", Name: "", LastName: "", Age: "", Gender: "", Email: "", Password: "")
         return
           NavigationView {
         UsersListView(user: user)
           }
     }
 }
