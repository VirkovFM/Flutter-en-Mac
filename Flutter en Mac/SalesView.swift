//
//  SalesView.swift
//  Flutter en Mac
//
//  Created by ISSC_611_2023 on 26/04/23.
//

import SwiftUI

struct SalesView: View {
    
    @State private var Id = ""
    @State private var name = ""
    @State private var quantity = ""
    @State private var IDV = ""
    @State private var IDC = ""
    @State private var pieces = ""
    @State private var subtotal = ""
    @State private var total = ""
    @State private var showAlert = false
    
    var body: some View {
        Color(#colorLiteral(red: 0.224, green: 0.224, blue: 0.224, alpha: 1)).edgesIgnoringSafeArea(.vertical).overlay(
        VStack{
            
            Text("Sales").font(.largeTitle).padding().foregroundColor(Color.white).overlay(
                Text("Sales").font(.largeTitle).padding().foregroundColor(Color(red: 0.596, green: 0.694, blue: 0.769)).blur(radius: 5))
            
            Form{
                
                TextField("ID", text: $Id)
                TextField("Name", text: $name)
                TextField("Last Name", text: $quantity)
                TextField("Age", text: $IDV)
                TextField("Gender", text: $IDC)
                TextField("Email", text: $pieces)
                TextField("Password", text: $subtotal)
                TextField("Rol", text: $total)
            }.padding().scrollContentBackground(.hidden)
                
            
            Button("High"){
                //mos
                //mostrarAlerta = true
                //print($nombre)
                if(Id == "" || name == "" || quantity == "" || IDV == "" || IDC == "" || pieces == "" || subtotal == "" || total == ""){
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
struct SalesView_Previews: PreviewProvider {
    static var previews: some View {
        SalesView()
    }
}
