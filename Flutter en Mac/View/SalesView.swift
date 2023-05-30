//
//  SalesView.swift
//  Flutter en Mac
//
//  Created by ISSC_611_2023 on 26/04/23.
//

import SwiftUI

struct SalesView: View {
    
    ///LO DEL PROFE
    @Environment(\.presentationMode) private var presentationMode
    @State var presentActionSheet = false
     
    //VIewModel
    @ObservedObject var viewModel = SaleViewModels()
    var mode: Mode = .new
    var completionHandler: ((Result<Action, Error>) -> Void)?
    
    /////LO DEL PROFE FIN
    
    @State private var showAlert = false
    
    @State private var registerBool = false
    @State private var mostrarAlertaVacio = false //ALERT
    
    var body: some View {
        Color(#colorLiteral(red: 0.224, green: 0.224, blue: 0.224, alpha: 1)).edgesIgnoringSafeArea(.vertical).overlay(
        VStack{
            
            customtitle(text: "SALES", x: -160, y: 30, width: 200, offX: -150, offY: 15)
                        
            Button(action: {
                if (viewModel.sale.ID == ""){
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
                
                TextField("ID", text: $viewModel.sale.ID)
                
                Section{
                    TextField("NAME", text: $viewModel.sale.Name)
                }
                Section{
                    TextField("CANT", text: $viewModel.sale.Amount)
                }
                Section{
                    TextField("ID Product", text: $viewModel.sale.IdSale)
                }
                Section{
                    TextField("ID Cliente", text: $viewModel.sale.IdBuy)
                }
                Section{
                    TextField("PIECES", text: $viewModel.sale.Pieces)
                }
                Section{
                    TextField("SUBTOTAL", text: $viewModel.sale.Subtotal)
                }
                Section{
                    TextField("TOTAL", text: $viewModel.sale.Total)
                }
                
            }.padding()
                .scrollContentBackground(.hidden)
                //FORM
                .scrollContentBackground(.hidden)
                
            
            Button(action:{
                
                //Cambie en este pero no estoy del todo seguro si jale a como estan en las vistas
                if(viewModel.sale.ID == "" || viewModel.sale.Name == "" || viewModel.sale.Amount == "" || viewModel.sale.IdSale == "" || viewModel.sale.IdBuy == "" || viewModel.sale.Pieces == "" || viewModel.sale.Subtotal == "" || viewModel.sale.Total == ""){
                    showAlert = true
                }else{
                    //Se ejecuta el CREATE de CRUD
                    if (mode == .new){
                        viewModel.sale.id = viewModel.sale.ID
                    }
                    self.handleDoneTapped()
                }
            }) {
                Text(mode == .new ? "REGISTER" : "SAVE")
                    .fontWeight(.bold)        
            }.buttonStyle(FilledButtonStyle()).alert(isPresented: $showAlert){
                Alert(title: Text("ERROR"), message: Text("Llene todos los campos"))
            }
            
            if(registerBool){
                NavigationLink(destination: MenuAdmin(), isActive: $registerBool){
                    EmptyView()
                }.hidden()
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



struct SalesView_Previews: PreviewProvider {
    static var previews: some View {
        SalesView()
    }
}
