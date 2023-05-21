import SwiftUI

struct PurchaseView: View {
    
    ///LO DEL PROFE
    @Environment(\.presentationMode) private var presentationMode
    @State var presentActionSheet = false
     
    //VIewModel
    @ObservedObject var viewModel = PurchaseViewModels()
    var mode: Mode = .new
    var completionHandler: ((Result<Action, Error>) -> Void)?
    
    var deleteButton: some View {
        /*if mode == .edit {
          
        }*/
      Button(action: {
          if (idProduct == ""){
              mostrarAlertaVacio = true
          }else{
              //Se ejecuta el CREATE de CRUD
              viewModel.purchase.id = idProduct
              viewModel.purchase.ID = idProduct
              self.handleDeleteTapped()
          }

      }) {
          if mode == .edit{
              Image(systemName: "trash").foregroundColor(Color.red)
          }
      }
    }
    /////LO DEL PROFE FIN
    
    
    @State private var idProduct = ""
    
    @State private var mostrarAlertaVacio = false
    var body: some View {
        Color(#colorLiteral(red: 0.224, green: 0.224, blue: 0.224, alpha: 1)).edgesIgnoringSafeArea(.vertical).overlay(
        VStack{
            
            Text("PURCHASE")
                .fontWeight(.bold)
                .font(.system(size: 30))
                .offset(x: -125, y: 90)
                .foregroundColor(Color(red: 0.596, green: 0.694, blue: 0.769))
                .padding(EdgeInsets(top: 0, leading: 35, bottom: 0, trailing: 0))
                
            Divider()
                 .background(Color.white)
                 .frame(width: 300)
                 .offset(x: -150, y: 70)
            
            Form{
                TextField("ID PRODUCT", text: $idProduct)
                Section{
                    TextField("NAME", text: $viewModel.purchase.name)
                }
                Section{
                    TextField("PIECES", text: $viewModel.purchase.pieces)
                }
                Section{
                    TextField("IDA", text: $viewModel.purchase.idAdmin)
                }
            }
            .padding()
            .scrollContentBackground(.hidden)
            .navigationBarItems(
              trailing: deleteButton
            )//FORM
            .scrollContentBackground(.hidden)
            
            Button(action:{
            
                if(idProduct == "" || viewModel.purchase.name == "" || viewModel.purchase.pieces == "" || viewModel.purchase.idAdmin == ""){
                    mostrarAlertaVacio = true
                    
                }
                else{
                    viewModel.purchase.id = idProduct
                    viewModel.purchase.ID = idProduct
                    self.handleDoneTapped()
                }
                
            }){
                Text(mode == .new ? "REGISTER" : "SAVE")
                    .fontWeight(.bold)
                
            }.buttonStyle(FilledButtonStyle())
                .fontWeight(.bold)
                .alert(isPresented: $mostrarAlertaVacio){
                    Alert(title: Text("Tonto"), message: Text("Llene los campos"))
                }
                /*.alert(isPresented: $mostrarAlerta){
                Alert(title: Text("Hola"), message: Text("Has presionado el boton"))
            }*/
        })
        
    }
    
    // Action Handlers
    func handleDoneTapped() {
      self.viewModel.handleDoneTapped()
      self.dismiss()
    }
     
    func handleDeleteTapped() {
      viewModel.handleDeleteTapped()
      self.dismiss()
      self.completionHandler?(.success(.delete))
    }
     
    func dismiss() {
      self.presentationMode.wrappedValue.dismiss()
    }
}

struct PurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseView()
    }
}


