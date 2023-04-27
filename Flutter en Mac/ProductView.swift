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
    @State private var lastName = ""
    @State private var age = ""
    @State private var gender = ""
    @State private var email = ""
    @State private var password = ""
    @State private var rol = ""
    @State private var showAlert = false
    
    var body: some View {
        Color(#colorLiteral(red: 0.224, green: 0.224, blue: 0.224, alpha: 1)).edgesIgnoringSafeArea(.vertical).overlay(
        VStack{
            
            Text("PRODUCT").font(.largeTitle).padding()
            
            Form{
                
                TextField("ID", text: $Id)
                TextField("NAME", text: $name)
                TextField("LASTNAME", text: $lastName)
                TextField("AGE", text: $age)
                TextField("GENDER", text: $gender)
                TextField("EMAIL", text: $email)
                TextField("PASSWORD", text: $password)
                TextField("ROL", text: $rol)
            }.padding(.horizontal, -17).scrollContentBackground(.hidden)
                
            
            Button("HIGH"){
                //mos
                //mostrarAlerta = true
                //print($nombre)
                if(Id == "" || name == "" || lastName == "" || age == "" || gender == "" || email == "" || password == "" || rol == ""){
                    showAlert = true
                    
                }
                
            }.frame(minWidth: 0, maxWidth: 100).padding().buttonStyle(grayButton())
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
