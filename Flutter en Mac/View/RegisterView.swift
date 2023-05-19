//
//  RegisterView.swift
//  Flutter en Mac
//
//  Created by ISSC_611_2023 on 26/04/23.
//

import SwiftUI

struct RegisterView: View {
    @State private var IDUsuario = ""
    @State private var Nombre = ""
    @State private var Apellido = ""
    @State private var Edad = ""
    @State private var Genero = ""
    @State private var Email = ""
    @State private var Contrasena = ""
    @State private var Rol = ""
    @State private var showError = false
    @State private var mostrarAlertaVacio = false //ALERT
    // DROPDOWN
        let options = ["Masculino", "Femenino"]
            @State private var selectedOption = 0
    
    @State private var registerBool = false
    
    
    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 0.224, green: 0.224, blue: 0.224, alpha: 1)).edgesIgnoringSafeArea(.all)
            VStack{
                Spacer(minLength: 30)
     
                
                Text("INTERFACE REGISTER")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.596, green: 0.694, blue: 0.769))
                    .offset(x:-49, y: 30)
                    .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
                
                Divider()
                    .background(Color.white)
                    .frame(width: 350)
                    .offset(x: -39, y: 10)
                
                
                Form{
                    TextField("ID", text: $IDUsuario)
                    Section{
                        TextField("NAME", text: $Nombre)
                    }
                    Section{
                        TextField("LAST NAME", text: $Apellido)
                    }
                    Section{
                        TextField("AGE", text: $Edad)
                    }
                    // DROPDOWN ***********************
                    Picker(selection: $selectedOption, label: Text("Selecciona un genero")) {
                        ForEach(0..<options.count) {
                            index in
                            Text(options[index])
                        }
                    }.pickerStyle(MenuPickerStyle())
                                       // ***************************
                    Section{
                        TextField("EMAIL", text: $Email)
                    }
                    Section{
                        SecureField("PASSWORD", text: $Contrasena)
                    }
                    Section{
                        TextField("ROL", text: $Rol)
                    }
                    
                }.padding()
                .scrollContentBackground(.hidden)
                
                Button(action:{
                    print(selectedOption)
                    Genero = String(selectedOption)
                    if(IDUsuario == "" || Nombre == "" || Apellido == "" || Edad == "" || Genero == "" || Email == "" || Contrasena == "" || Rol == ""){
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
                
                
                
                
            }
        }
    }
}


    


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
