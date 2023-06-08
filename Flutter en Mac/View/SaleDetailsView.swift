import SwiftUI
 
struct SaleDetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var presentEditSaleSheet = false
     
    var sale: Sale
     
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
                        titlelight(text: "Name Product")
                        Text(sale.NameProduct)
                    }
                    Section{
                        titlelight(text: "Pieces")
                        Text(sale.Pieces)
                    }
                    Section{
                        titlelight(text: "Total")
                        Text(sale.Total)
                    }
                }.scrollContentBackground(.hidden)
            }
      )
      //.navigationBarTitle(user.Name)
      .navigationBarItems(trailing: editButton {
        self.presentEditSaleSheet.toggle()
      })
      /*.onAppear() {
          print("UserDetailsView.onAppear() for \(self.user.Name)")
      }*/
      .onDisappear() {
        print("SaleDetailsView.onDisappear()")
      }
      .sheet(isPresented: self.$presentEditSaleSheet) {
          /*
          NavigationLink(destination: RegisterView(viewModel: UserViewModels(user: user), mode: .edit)
          
          ){
              EmptyView()
          }.hidden()
          */
        SalesView(viewModel: SaleViewModels(sale: sale), mode: .edit) { result in
          if case .success(let action) = result, action == .delete {
            self.presentationMode.wrappedValue.dismiss()
          }
        }
      }
    }
     
  }
 
struct SaleDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let sale = Sale(id: "", ID: "", IdCliente: "", IdProduct: "", NameProduct: "", Pieces: "", Subtotal: "", Total: "")
        return
          NavigationView {
            SaleDetailsView(sale: sale)
          }
    }
}
