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
    
    //VARIABLE GLOBAL PARA PARA EL COSTO EXTRA DEPENDIENDO DEL PRODUCTO SELECCIONADO
    var extra: Int = 0
    /////LO DEL PROFE FIN
    @State private var showAlert = false
    @State private var mostrarAlertaVacio = false //ALERT
    // DROPDOWN
        let options = ["Masculino", "Femenino"]
            @State private var selectedOption = 0
    // DROPDOWN CAtegory
        let optionsCategory = ["Buceo", "Montañismo/Ciclismo", "Esqui", "Pesca/Caza"]
            @State private var selectedOptionC = 0
    // DROPDOWN
        let optionsType = ["Guantes", "Mangas", "Shorts", "Playeras", "Pasamontañas", "Pants", "Cuerpo completo"]
            @State private var selectedOptionT = 0
    
    @State private var registerBool = false
    
    var body: some View {
        Color(#colorLiteral(red: 0.224, green: 0.224, blue: 0.224, alpha: 1)).edgesIgnoringSafeArea(.vertical).overlay(
        VStack{
            
            customtitle(text: "PRODUCT", x: -140, y: 20, width: 220, offX: -140,offY: 0)
               
            Button(action: {
                if (viewModel.product.ID == ""){
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
                TextField("ID", text: $viewModel.product.ID)
                
                Section{
                    TextField("Name", text: $viewModel.product.Name)
                }
                Section{
                    TextField("Description", text: $viewModel.product.Description)
                }
                Section{
                    // DROPDOWN ***********************
                    Picker(selection: $selectedOptionC, label: Text("Category:")) {
                        ForEach(0..<optionsCategory.count) {
                            index in
                            Text(optionsCategory[index])
                        }
                    }.pickerStyle(MenuPickerStyle())
                    // ***************************
                }
                
                // DROPDOWN ***********************
                Picker(selection: $selectedOption, label: Text("Gender:")) {
                    ForEach(0..<options.count) {
                        index in
                        Text(options[index])
                    }
                }.pickerStyle(MenuPickerStyle())
                // ***************************
                Section{
                    Section{
                        // DROPDOWN ***********************
                        Picker(selection: $selectedOptionT, label: Text("Type:")) {
                            ForEach(0..<optionsType.count) {
                                index in
                                Text(optionsType[index])
                            }
                        }.pickerStyle(MenuPickerStyle())
                        // ***************************
                    }
                }
                Section{
                    TextField("Units", text: $viewModel.product.Units)
                }
                Section{
                    TextField("Price", text: $viewModel.product.Price)
                }
                
                
                
        
            }.padding()
                .scrollContentBackground(.hidden)
                //FORM
                .scrollContentBackground(.hidden)
                
            
            Button(action:{
                //Extraer combobox
                viewModel.product.Category = optionsCategory[selectedOptionC]
                viewModel.product.Gender = options[selectedOption]
                viewModel.product.Types = optionsType[selectedOptionT]
                //print("",viewModel.product.Category, "",viewModel.product.Gender, "",viewModel.product.Types)
                if(viewModel.product.ID == "" || viewModel.product.Name == "" || viewModel.product.Description == "" ||  viewModel.product.Units == "" || viewModel.product.Price == ""){
                    
                    mostrarAlertaVacio = true
                }else{
                    //Se ejecuta el CREATE de CRUD
                    var extra = 0
                    switch selectedOptionC {
                    case 0:
                        extra = 80
                    case 1:
                        extra = 25
                    case 2:
                        extra = 50
                    default:
                        extra = 0
                    }
                    
                    viewModel.product.TotalFinal = String((Int(viewModel.product.Price) ?? 0) + extra) //ASIGNAT TOTAL ESTUPIDO
                    if (mode == .new){
                        viewModel.product.id = viewModel.product.ID
                    }
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


