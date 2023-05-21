//
//  ProductView.swift
//  Flutter en Mac
//
//  Created by ISSC_611_2023 on 26/04/23.
//

import SwiftUI

struct ProductView: View {
    ///LO DEL PROFE
    @Environment(\.presentationMode) private var presentationMode
    @State var presentActionSheet = false
     
    //VIewModel
    @ObservedObject var viewModel = ProductViewModels()
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
              viewModel.product.id = Id
              viewModel.product.ID = Id
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
    @State private var mostrarAlertaVacio = false //ALERT
    
    
    @State private var registerBool = false
    
    var body: some View {
        Color(#colorLiteral(red: 0.224, green: 0.224, blue: 0.224, alpha: 1)).edgesIgnoringSafeArea(.vertical).overlay(
        VStack{
            
            Text("PRODUCT")
                .font(.system(size: 30))
                .foregroundColor(Color(red: 0.596, green: 0.694, blue: 0.769))
                .fontWeight(.bold)
                .padding()
                .offset(x: -140, y: 20)
                .padding(EdgeInsets(top: 0, leading: 55, bottom: 0, trailing: 0))
            
            Divider()
                .background(Color.white)
                .frame(width: 220)
                .offset(x: -140)
               
            
            
            Form{
                TextField("ID", text: $Id)
                
                Section{
                    TextField("Name", text: $viewModel.product.name)
                }
                Section{
                    TextField("Description", text: $viewModel.product.description)
                }
                Section{
                    TextField("Units", text: $viewModel.product.unit)
                }
                Section{
                    TextField("Cost", text: $viewModel.product.cost)
                }
                Section{
                    TextField("Price", text: $viewModel.product.price)
                }
                Section{
                    TextField("Utility", text: $viewModel.product.utility)
                }
        
            }.padding()
                .scrollContentBackground(.hidden)
                .navigationBarItems(
                  trailing: deleteButton
                )//FORM
                .scrollContentBackground(.hidden)
                
            
            Button(action:{
                
                if(Id == "" || viewModel.product.name == "" || viewModel.product.description == "" || viewModel.product.unit == "" || viewModel.product.cost == "" || viewModel.product.price == "" || viewModel.product.utility == ""){
                    
                    mostrarAlertaVacio = true
                }else{
                    //Se ejecuta el CREATE de CRUD
                    viewModel.product.id = Id
                    viewModel.product.ID = Id
                    self.handleDoneTapped()
                }
            }) {
                Text(mode == .new ? "REGISTER" : "SAVE")
                    .fontWeight(.bold)
            }.buttonStyle(FilledButtonStyle()).alert(isPresented: $mostrarAlertaVacio){
                Alert(title: Text("ERROR"), message: Text("Llene todos los campos"))
            }
            
            if(registerBool){
                NavigationLink(destination: MenuAdmin(), isActive: $registerBool){
                    EmptyView()
                }.hidden()
            }
            
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

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}


