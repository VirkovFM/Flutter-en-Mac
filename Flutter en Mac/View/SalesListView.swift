import SwiftUI
import Firebase


struct SalesListView: View {
    @StateObject var viewModel = SalesViewModel()
    @State var presentAddMovieSheet = false

    private var addButton: some View {
        Button(action: { self.presentAddMovieSheet.toggle() }) {
            Image(systemName: "plus").foregroundColor(Color(red: 0.596, green: 0.694, blue: 0.769))
        }
    }

    private func saleRowView(sale: Sale) -> some View {
        NavigationLink(destination: SaleDetailsView(sale: sale)) {
            VStack(alignment: .leading) {
                Text(sale.NameProduct)
                    .font(.headline)
                Text(sale.Pieces)
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
                    
                    customtitle(text: "SALE LIST", x: -135, y: 30, width: 230, offX: -120, offY: 10)
                    
                    List {
                        ForEach(viewModel.Sales) { sale in
                            saleRowView(sale: sale)
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
                        print("SalesListView appears. Subscribing to data updates.")
                        self.viewModel.subscribe()
                    }
                    .sheet(isPresented: self.$presentAddMovieSheet) {
                        
                        
                        SalesView()
                    }
                }
            })
        //}
    }
}


struct SalesListView_Previews: PreviewProvider {
    static var previews: some View {
        SalesListView()
    }
}
