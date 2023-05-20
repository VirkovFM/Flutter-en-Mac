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
    
    @State private var registerBool = false
    
    //VIewModel
    @ObservedObject var viewModel = SaleViewModels()
    
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
                    TextField("NAME", text: $name)
                }
                Section{
                    TextField("CANT", text: $quantity)
                }
                Section{
                    TextField("IDV", text: $IDV)
                }
                Section{
                    TextField("IDC", text: $IDC)
                }
                Section{
                    TextField("PIECES", text: $pieces)
                }
                Section{
                    TextField("SUBTOTAL", text: $subtotal)
                }
                Section{
                    TextField("TOTAL", text: $total)
                }
                
            }.padding().scrollContentBackground(.hidden)
                
            
            Button(action:{
                
                //Cambie en este pero no estoy del todo seguro si jale a como estan en las vistas
                if(Id == "" || name == "" || quantity == "" || IDV == "" || IDC == "" || pieces == "" || subtotal == "" || total == ""){
                    showAlert = true
                }else{
                    //Se ejecuta el CREATE de CRUD
                    
                    registerBool = true
                }
            }) {
                Text("REGISTER")
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
}
struct SalesView_Previews: PreviewProvider {
    static var previews: some View {
        SalesView()
    }
}
