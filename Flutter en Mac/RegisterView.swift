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
                    Section{
                        TextField("GENDER", text: $Genero)
                    }
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
                
                NavigationLink(destination: ContentView(), label: {Text("REGISTER")}).buttonStyle(FilledButtonStyle())
                    .fontWeight(.bold)
                
                if(IDUsuario == "" || Nombre == "" || Apellido == "" || Edad == "" || Genero == "" || Email == "" || Contrasena == "" || Rol == ""){
                    
                  
                }else{
                    
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
