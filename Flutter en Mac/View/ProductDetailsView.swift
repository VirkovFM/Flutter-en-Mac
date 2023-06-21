import SwiftUI
 
struct ProductDetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var presentEditUserSheet = false
     
    var product: Product
     
    private func editButton(action: @escaping () -> Void) -> some View {
      Button(action: { action() }) {
        Text("Edit").foregroundColor(Color(red: 0.596, green: 0.694, blue: 0.769))
      }
    }
     
    var body: some View {
        Color(#colorLiteral(red: 0.224, green: 0.224, blue: 0.224, alpha: 1)).edgesIgnoringSafeArea(.vertical).overlay(
            ZStack{
                VStack{
                    Form {
                        Section{
                            titlelight(text: "Product Name")
                            Text(product.Name)
                        }
                        Section{
                            titlelight(text: "Description")
                            Text(product.Description)
                        }
                        Section{
                            titlelight(text: "Price")
                            Text(product.TotalFinal)
                        }
                    }.scrollContentBackground(.hidden)
                }
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
        print("ProductDetailsView.onDisappear()")
      }
      .sheet(isPresented: self.$presentEditUserSheet) {
          /*
          NavigationLink(destination: RegisterView(viewModel: UserViewModels(user: user), mode: .edit)
          
          ){
              EmptyView()
          }.hidden()
          */
        ProductView(viewModel: ProductViewModels(product: product), mode: .edit) { result in
          if case .success(let action) = result, action == .delete {
            self.presentationMode.wrappedValue.dismiss()
          }
        }
      }
    }
     
  }
 
struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let product = Product(id: "", ID: "", Name: "", Description: "", Category: "", Gender: "", Types: "", Units: "", Price: "", TotalFinal: "")
        return
          NavigationView {
            ProductDetailsView(product: product)
          }
    }
}
