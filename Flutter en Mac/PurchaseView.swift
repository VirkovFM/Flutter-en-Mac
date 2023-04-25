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
            
            Text("Aiba").font(.largeTitle).padding()
            
            Form{
                
                TextField("Id Product", text: $idProduct)
                TextField("Name", text: $name)
                SecureField("Pieces", text: $pieces)
                SecureField("IDA", text: $ida)
            }.padding().scrollContentBackground(.hidden)
            
            Button("Crear cuenta"){
                //mos
                //mostrarAlerta = true
                //print($nombre)
                if(idProduct == "" || name == "" || pieces == "" || ida == ""){
                    mostrarAlertaVacio = true
                    
                }
                
            }.buttonStyle(grayButton())
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

struct grayButton:ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.padding().background(Color(red: 0.596, green: 0.694, blue: 0.769))
            .foregroundColor(Color.white)
            .clipShape(Capsule())
    }
}
