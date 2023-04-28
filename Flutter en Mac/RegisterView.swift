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
    
    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 0.224, green: 0.224, blue: 0.224, alpha: 1)).edgesIgnoringSafeArea(.all)
            VStack{
                Spacer(minLength: 30)
     
                
                Text("Interface Register")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                
                Form{
                    TextField("ID", text: $IDUsuario)
                    Section{
                        TextField("Name", text: $Nombre)
                    }
                    Section{
                        TextField("Last Name", text: $Apellido)
                    }
                    Section{
                        TextField("Age", text: $Edad)
                    }
                    Section{
                        TextField("Gender", text: $Genero)
                    }
                    Section{
                        TextField("Email", text: $Email)
                    }
                    Section{
                        SecureField("Password", text: $Contrasena)
                    }
                    Section{
                        TextField("Rol", text: $Rol)
                    }
                    
                }.padding()
                .scrollContentBackground(.hidden)
                
                NavigationLink(destination: ContentView(), label: {Text("REGISTER")}).buttonStyle(FilledButtonStyle())
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
