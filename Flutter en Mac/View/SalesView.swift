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
    
    var deleteButton: some View {
        /*if mode == .edit {
          
        }*/
      Button(action: {
          if (Id == ""){
              mostrarAlertaVacio = true
          }else{
              //Se ejecuta el CREATE de CRUD
              viewModel.sale.id = Id
              viewModel.sale.ID = Id
              self.handleDeleteTapped()
              registerBool = true
          }

      }) {
          if mode == .edit{
              Image(systemName: "trash").foregroundColor(Color.red)
          }
      }
    }
    /////LO DEL PROFE FIN
    
    @State private var Id = ""
    @State private var showAlert = false
    
    @State private var registerBool = false
    @State private var mostrarAlertaVacio = false //ALERT
    
    var body: some View {
        Color(#colorLiteral(red: 0.224, green: 0.224, blue: 0.224, alpha: 1)).edgesIgnoringSafeArea(.vertical).overlay(
        VStack{
            
            
            Text("SALES")
                .fontWeight(.bold)
                .font(.system(size: 30))
                .offset(x: -160, y: 30)
                .foregroundColor(Color(red: 0.596, green: 0.694, blue: 0.769))
                .padding(EdgeInsets(top: 0, leading: 55, bottom: 0, trailing: 0))
        Divider()
            .background(Color.white)
            .offset(x: -150 ,y: 15)
            .frame(width: 200)
            
            Form{
                
                TextField("ID", text: $Id)
                
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
                .navigationBarItems(
                  trailing: deleteButton
                )//FORM
                .scrollContentBackground(.hidden)
                
            
            Button(action:{
                
                //Cambie en este pero no estoy del todo seguro si jale a como estan en las vistas
                if(Id == "" || viewModel.sale.Name == "" || viewModel.sale.Amount == "" || viewModel.sale.IdSale == "" || viewModel.sale.IdBuy == "" || viewModel.sale.Pieces == "" || viewModel.sale.Subtotal == "" || viewModel.sale.Total == ""){
                    showAlert = true
                }else{
                    //Se ejecuta el CREATE de CRUD
                    viewModel.sale.id = Id
                    viewModel.sale.ID = Id
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
