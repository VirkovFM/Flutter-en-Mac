import SwiftUI

struct PurchaseView: View {
    
    ///LO DEL PROFE
    @Environment(\.presentationMode) private var presentationMode
    @State var presentActionSheet = false
     
    //VIewModel
    @ObservedObject var viewModel = PurchaseViewModels()
    var mode: Mode = .new
    var completionHandler: ((Result<Action, Error>) -> Void)?
    
    
    /////LO DEL PROFE FIN
    
    
    
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
            
            Button(action: {
                if (viewModel.purchase.ID == ""){
                    mostrarAlertaVacio = true
                }else{
                    //Se ejecuta el CREATE de CRUD
                    self.handleDeleteTapped()
                    
                }

            }) {
                if mode == .edit{
                    Image(systemName: "trash").foregroundColor(Color.red)
                        //.offset(x:160, y: 30)
                
                
                }
            }
            
            Form{
                TextField("ID PRODUCT", text: $viewModel.purchase.ID)
                Section{
                    TextField("NAME", text: $viewModel.purchase.Name)
                }
                Section{
                    TextField("PIECES", text: $viewModel.purchase.Pieces)
                }
                Section{
                    TextField("IDA", text: $viewModel.purchase.IdAdmin)
                }
            }
            .padding(.vertical, 150)
            .scrollContentBackground(.hidden)
            //FORM
            .scrollContentBackground(.hidden)
            
            Button(action:{
            
                if(viewModel.purchase.ID == "" || viewModel.purchase.Name == "" || viewModel.purchase.Pieces == "" || viewModel.purchase.IdAdmin == ""){
                    mostrarAlertaVacio = true
                    
                }
                else{
                    if (mode == .new){
                        viewModel.purchase.id = viewModel.purchase.ID
                    }
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


