//
//  ContentView.swift
//  Flutter en Mac
//
//  Created by ISSC_611_2023 on 24/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var email = ""
    @State private var contrasena = ""
    @State private var mostrarAlerta = false
    
    var body: some View {
        Color(#colorLiteral(red: 0.224, green: 0.224, blue: 0.224, alpha: 1)).edgesIgnoringSafeArea(.vertical).overlay(ZStack {
            Text("Login")
            NavigationView{
                Color(#colorLiteral(red: 0.224, green: 0.224, blue: 0.224, alpha: 1)).edgesIgnoringSafeArea(.vertical).overlay(
                    VStack{
                        Text("Aiba").font(.largeTitle).padding()
                        Form{
                            Section{
                                TextField("User", text: $email)
                            }
                            Section{
                                SecureField("Password", text: $contrasena)
                            }
                        }.padding().scrollContentBackground(.hidden)
                        
                        /*Button("LOGIN"){
                            mostrarAlerta = true
                            mostrarAlerta = true
                            if (email != "" ){
                                if (contrasena != ""){
                                        mostrarAlerta = false
                                    
                                }
                            }
                        }.padding().buttonStyle(FilledButtonStyle()).alert(isPresented: $mostrarAlerta){*/
                        NavigationLink(destination: MenuAdmin(), label: {Text("LOGIN")}).padding().buttonStyle(FilledButtonStyle())

                        NavigationLink(destination: MenuAdmin(), label: {Text("REGISTER")}).buttonStyle(FilledButtonStyle())
                        
                        
                    }.foregroundColor(.white)) // #393939
                
                    /*Button("REGISTER"){
                        
                    }.buttonStyle(FilledButtonStyle())
*/
                }.padding()
                    
                    /*NavigationLink(destination: Login(), label: {Text("ir a la ventana del perfil")}).padding().foregroundColor(.black)*/
        }.navigationTitle("Home"))
        
            }
        }
    


struct FilledButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(configuration.isPressed ? Color.blue: Color(#colorLiteral(red: 0.596, green: 0.694, blue: 0.769, alpha: 1))) // #98b1c4)
            .foregroundColor(.white)
            .clipShape(Capsule())
            //.font(.system(size: 32))
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
