//
//  PurchaseView.swift
//  Flutter en Mac
//
//  Created by ISSC_611_2023 on 24/04/23.
//

import SwiftUI

struct PurchaseView: View {
    @State private var idProduct = ""
    @State private var name = ""
    @State private var pieces = ""
    @State private var ida = ""
    @State private var mostrarAlertaVacio = false
    var body: some View {
        Color(#colorLiteral(red: 0.224, green: 0.224, blue: 0.224, alpha: 1)).edgesIgnoringSafeArea(.vertical).overlay(
        VStack{
            
            Text("PURCHASE")
                .fontWeight(.bold)
                .font(.system(size: 30))
                .offset(x: -125, y: 90)
                .foregroundColor(Color(red: 0.596, green: 0.694, blue: 0.769))
                
            Divider()
                 .background(Color.white)
                 .frame(width: 250)
                 .offset(x: -150, y: 70)
            
            Form{
                TextField("ID PRODUCT", text: $idProduct)
                Section{
                    TextField("NAME", text: $name)
                }
                Section{
                    SecureField("PIECES", text: $pieces)
                }
                Section{
                    SecureField("IDA", text: $ida)
                }
            }
            .padding(.vertical, 150)
            .scrollContentBackground(.hidden)
            
            Button("CREAR CUENTA"){
            
                if(idProduct == "" || name == "" || pieces == "" || ida == ""){
                    mostrarAlertaVacio = true
                    
                }
                
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
}

struct PurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseView()
    }
}


