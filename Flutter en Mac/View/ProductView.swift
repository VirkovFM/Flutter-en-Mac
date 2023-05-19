//
//  ProductView.swift
//  Flutter en Mac
//
//  Created by ISSC_611_2023 on 26/04/23.
//

import SwiftUI

struct ProductView: View {
    
    @State private var Id = ""
    @State private var name = ""
    @State private var description = ""
    @State private var units = ""
    @State private var cost = ""
    @State private var price = ""
    @State private var utility = ""
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
                    TextField("Name", text: $name)
                }
                Section{
                    TextField("Description", text: $description)
                }
                Section{
                    TextField("Units", text: $units)
                }
                Section{
                    TextField("Cost", text: $cost)
                }
                Section{
                    TextField("Price", text: $price)
                }
                Section{
                    TextField("Utility", text: $utility)
                }
        
            }.padding().scrollContentBackground(.hidden)
                
            
            Button(action:{
                
                if(Id == "" || name == "" || description == "" || units == "" || cost == "" || price == "" || utility == ""){
                    mostrarAlertaVacio = true
                }else{
                    //Se ejecuta el CREATE de CRUD
                    
                    registerBool = true
                }
            }) {
                Text("REGISTER")
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
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}


