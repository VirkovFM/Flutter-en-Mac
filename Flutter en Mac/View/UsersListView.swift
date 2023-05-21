import SwiftUI
import Firebase


struct UsersListView: View {
    @StateObject var viewModel = UsersViewModel()
    @State var presentAddMovieSheet = false

    private var addButton: some View {
        Button(action: { self.presentAddMovieSheet.toggle() }) {
            Image(systemName: "plus").foregroundColor(Color(red: 0.596, green: 0.694, blue: 0.769))
        }
    }

    private func userRowView(user: users) -> some View {
        NavigationLink(destination: UserDetailsView(user: user)) {
            VStack(alignment: .leading) {
                Text(user.Name)
                    .font(.headline)
                Text(user.Email)
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
                    
                    
                    Text("INTERFACE REGISTER")
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
                        ForEach(viewModel.Users) { user in
                            userRowView(user: user)
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
                        print("MoviesListView appears. Subscribing to data updates.")
                        self.viewModel.subscribe()
                    }
                    .sheet(isPresented: self.$presentAddMovieSheet) {
                        
                        
                        RegisterView()
                    }
                }
            })
        //}
    }
}


struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
    }
}

