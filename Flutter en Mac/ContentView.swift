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
        
        
        Color(#colorLiteral(red: 0.224, green: 0.224, blue: 0.224, alpha: 1)).edgesIgnoringSafeArea(.vertical).overlay(
            
            ZStack {
            NavigationView{

                Color(#colorLiteral(red: 0.224, green: 0.224, blue: 0.224, alpha: 1)).edgesIgnoringSafeArea(.vertical).overlay(
                    VStack(spacing: 20){
                        
                        Text("LOGIN")
                            .font(.largeTitle)
                            .font(.system(size: 30))
                            .foregroundColor(Color(red: 0.596, green: 0.694, blue: 0.769))
                            .fontWeight(.bold)
                            .padding()
                            .padding(.bottom)
                        
                        Image("user")
                        
                        Text("USER")
                            .offset(x:-155, y: 45)
                            .font(.system(size: 30))
                            .foregroundColor(Color(red: 0.596, green: 0.694, blue: 0.769))
                            .fontWeight(.bold)
                        Form{
                            Section{
                                TextField("USER", text: $email)
                                    .foregroundColor(.black)
                            }
                            
                            Section{
                                SecureField("PASSWORD", text: $contrasena)
                                    .foregroundColor(.black)
                                
                            }
                            
                            
                            
                        }
                        .scrollContentBackground(.hidden)
                        
                        NavigationLink(destination: MenuAdmin(), label: {Text("LOGIN")}).padding().buttonStyle(FilledButtonStyle())
                            .offset(y: -100)
                            .fontWeight(.bold)

                        NavigationLink(destination: RegisterView(), label: {Text("REGISTER")}).buttonStyle(FilledButtonStyle())
                            .offset(y: -100)
                            .fontWeight(.bold)
                        
                        
                    }.foregroundColor(.white)) // #393939
                
                    /*Button("REGISTER"){
                        
                    }.buttonStyle(FilledButtonStyle())
*/
            }.padding(.top)
                
                    
                    /*NavigationLink(destination: Login(), label: {Text("ir a la ventana del perfil")}).padding().foregroundColor(.black)*/
            }.navigationTitle("a").background(Color(red: 0.596, green: 0.694, blue: 0.769)))
            }
    
        }
    


struct FilledButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 300)
            .background(configuration.isPressed ? Color.blue: Color(#colorLiteral(red: 0.596, green: 0.694, blue: 0.769, alpha: 1))) // #98b1c4)
            .foregroundColor(.white)
            .clipShape(Capsule())
        
            //.font(.system(size: 32))
        

    }
}

struct LogoView: View {
    var body: some View {
        Image("Tree")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 30, height: 30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
