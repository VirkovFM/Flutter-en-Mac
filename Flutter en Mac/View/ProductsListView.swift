import SwiftUI
import Firebase


struct ProductsListView: View {
    @StateObject var viewModel = ProductsViewModel()
    @State var presentAddMovieSheet = false

    private var addButton: some View {
        Button(action: { self.presentAddMovieSheet.toggle() }) {
            Image(systemName: "plus").foregroundColor(Color(red: 0.596, green: 0.694, blue: 0.769))
        }
    }

    private func productRowView(product: Product) -> some View {
        NavigationLink(destination: ProductDetailsView(product: product)) {
            VStack(alignment: .leading) {
                Text(product.Name)
                    .font(.headline)
                Text(product.Description)
                    .font(.subheadline)
            }
        }
    }

    var body: some View {
        //NavigationView {
        Color(#colorLiteral(red: 0.224, green: 0.224, blue: 0.224, alpha: 1)).edgesIgnoringSafeArea(.vertical).overlay(
            ZStack {
                

                VStack {
                    Spacer(minLength: 30)
                    
                    
                    Text("PRODUCT LIST")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.596, green: 0.694, blue: 0.769))
                        .offset(x:-49, y: 30)
                        .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
                    
                    Divider()
                        .background(Color.white)
                        .frame(width: 350)
                        .offset(x: -39, y: 10)
                    
                    List {
                        ForEach(viewModel.Products) { product in
                            productRowView(product: product)
                        }
                        .onDelete { indexSet in
                            viewModel.removeMovies(atOffsets: indexSet)
                        }
                    }
                    .scrollContentBackground(.hidden)
                    /*.navigationBarTitle(Text("USER LIST")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.596, green: 0.694, blue: 0.769))
                    )*/
                    .navigationBarItems(trailing: addButton)
                    .onAppear {
                        print("ProductsListView appears. Subscribing to data updates.")
                        self.viewModel.subscribe()
                    }
                    .sheet(isPresented: self.$presentAddMovieSheet) {
                        
                        
                        ProductView()
                    }
                }
            })
        //}
    }
}


struct ProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
    }
}
