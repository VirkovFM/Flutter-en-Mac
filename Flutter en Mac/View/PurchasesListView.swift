import SwiftUI
import Firebase


struct PurchasesListView: View {
    @StateObject var viewModel = PurchasesViewModel()
    @State var presentAddMovieSheet = false

    private var addButton: some View {
        Button(action: { self.presentAddMovieSheet.toggle() }) {
            Image(systemName: "plus").foregroundColor(Color(red: 0.596, green: 0.694, blue: 0.769))
        }
    }

    private func purchaseRowView(purchase: Purchase) -> some View {
        NavigationLink(destination: PurchaseDetailsView(purchase: purchase)) {
            VStack(alignment: .leading) {
                Text(purchase.ID)
                    .font(.headline)
                Text(purchase.Name)
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
                    
                    customtitle(text: "PURCHASE LIST", x: -85, y: 30, width: 290, offX: -50, offY: 10)
                    
                    List {
                        ForEach(viewModel.Purchases) { purchase in
                            purchaseRowView(purchase: purchase)
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
                        print("PurchasesListView appears. Subscribing to data updates.")
                        self.viewModel.subscribe()
                    }
                    .sheet(isPresented: self.$presentAddMovieSheet) {
                        
                        
                        PurchaseView()
                    }
                }
            })
        //}
    }
}


struct PurchasesListView_Previews: PreviewProvider {
    static var previews: some View {
        PurchasesListView()
    }
}
