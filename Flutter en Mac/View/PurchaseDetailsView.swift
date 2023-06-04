import SwiftUI
 
struct PurchaseDetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var presentEditPurchaseSheet = false
     
    var purchase: Purchase
     
    private func editButton(action: @escaping () -> Void) -> some View {
      Button(action: { action() }) {
        Text("Edit").foregroundColor(Color(red: 0.596, green: 0.694, blue: 0.769))
      }
    }
     
    var body: some View {
        Color(#colorLiteral(red: 0.224, green: 0.224, blue: 0.224, alpha: 1)).edgesIgnoringSafeArea(.vertical).overlay(
            ZStack{
                Form {
                  Section(header: Text("Purchase")) {
                      Text(purchase.ID)
                      Text(purchase.Name)
                       
                  }
                   
                  Section(header: Text("Seller ID")) {
                      Text(purchase.IdAdmin)
                  }
                }.scrollContentBackground(.hidden)
            }
      )
      //.navigationBarTitle(user.Name)
      .navigationBarItems(trailing: editButton {
        self.presentEditPurchaseSheet.toggle()
      })
      /*.onAppear() {
          print("UserDetailsView.onAppear() for \(self.user.Name)")
      }*/
      .onDisappear() {
        print("PurchaseDetailsView.onDisappear()")
      }
      .sheet(isPresented: self.$presentEditPurchaseSheet) {
          /*
          NavigationLink(destination: RegisterView(viewModel: UserViewModels(user: user), mode: .edit)
          
          ){
              EmptyView()
          }.hidden()
          */
        PurchaseView(viewModel: PurchaseViewModels(purchase: purchase), mode: .edit) { result in
          if case .success(let action) = result, action == .delete {
            self.presentationMode.wrappedValue.dismiss()
          }
        }
      }
    }
     
  }
 
struct PurchaseDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let purchase = Purchase(id: "", ID: "", IdSale: "1", IdAdmin: "", Name: "")
        return
          NavigationView {
            PurchaseDetailsView(purchase: purchase)
          }
    }
}
