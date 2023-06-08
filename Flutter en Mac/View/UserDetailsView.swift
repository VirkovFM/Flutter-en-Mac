import SwiftUI
 
struct UserDetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var presentEditUserSheet = false
     
    var user: users
     
    private func editButton(action: @escaping () -> Void) -> some View {
      Button(action: { action() }) {
        Text("Edit").foregroundColor(Color(red: 0.596, green: 0.694, blue: 0.769))
      }
    }
     
    var body: some View {
        Color(#colorLiteral(red: 0.224, green: 0.224, blue: 0.224, alpha: 1)).edgesIgnoringSafeArea(.vertical).overlay(
            ZStack{
                Form {
                    Section{
                        titlelight(text: "User Name")
                        Text(user.Name)
                    }
                    Section{
                        titlelight(text: "LastName")
                        Text(user.LastName)
                    }
                    Section{
                        titlelight(text: "Email")
                        Text(user.Email)
                    }
                }.scrollContentBackground(.hidden) 
            }
      )
      //.navigationBarTitle(user.Name)
      .navigationBarItems(trailing: editButton {
        self.presentEditUserSheet.toggle()
      })
      /*.onAppear() {
          print("UserDetailsView.onAppear() for \(self.user.Name)")
      }*/
      .onDisappear() {
        print("UserDetailsView.onDisappear()")
      }
      .sheet(isPresented: self.$presentEditUserSheet) {
          /*
          NavigationLink(destination: RegisterView(viewModel: UserViewModels(user: user), mode: .edit)
          
          ){
              EmptyView()
          }.hidden()
          */
        RegisterView(viewModel: UserViewModels(user: user), mode: .edit) { result in
          if case .success(let action) = result, action == .delete {
            self.presentationMode.wrappedValue.dismiss()
          }
        }
      }
    }
     
  }
 
struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let user = users(id: "", ID: "", Name: "", LastName: "", Age: "", Gender: "", Email: "", Password: "")
        return
          NavigationView {
            UserDetailsView(user: user)
          }
    }
}
