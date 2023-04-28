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
    
    var body: some View {
        Color(#colorLiteral(red: 0.224, green: 0.224, blue: 0.224, alpha: 1)).edgesIgnoringSafeArea(.vertical).overlay(
        VStack{
            
            Text("Product").font(.largeTitle).padding().foregroundColor(Color.white).overlay(
                Text("Product").font(.largeTitle).padding().foregroundColor(Color(red: 0.596, green: 0.694, blue: 0.769)).blur(radius: 5))
            
            
            Form{
                
                TextField("ID", text: $Id)
                TextField("Name", text: $name)
                TextField("Description", text: $description)
                TextField("Units", text: $units)
                TextField("Cost", text: $cost)
                TextField("Price", text: $price)
                TextField("Utility", text: $utility)
            }.padding().scrollContentBackground(.hidden)
                
            
            Button("High"){
                //mos
                //mostrarAlerta = true
                //print($nombre)
                if(Id == "" || name == "" || description == "" || units == "" || cost == "" || utility == "" || price == "" ){
                    showAlert = true
                    
                }
                
            }.frame(minWidth: 0, maxWidth: 100).buttonStyle(grayButton())
                .alert(isPresented: $showAlert){
                    Alert(title: Text("Tonto"), message: Text("Llene los campos"))
                }
                /*.alert(isPresented: $mostrarAlerta){
                Alert(title: Text("Hola"), message: Text("Has presionado el boton"))
            }*/
        })
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}


