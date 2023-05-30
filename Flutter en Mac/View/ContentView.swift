//
//  ContentView.swift
//  Flutter en Mac
//
//  Created by ISSC_611_2023 on 24/04/23.
//

import SwiftUI

enum Mode {
  case new
  case edit
}
 
enum Action {
  case delete
  case done
  case cancel
}

struct ContentView: View {
    @State private var email = ""
    @State private var contrasena = ""
    @State private var mostrarAlerta = false
    @State private var MenuBool = false
    
    var body: some View {
        
        Color(#colorLiteral(red: 0.224, green: 0.224, blue: 0.224, alpha: 1)).edgesIgnoringSafeArea(.vertical).overlay(
            
            ZStack {
            NavigationView{
                Color(#colorLiteral(red: 0.224, green: 0.224, blue: 0.224, alpha: 1)).edgesIgnoringSafeArea(.vertical).overlay(
                    VStack{
                        
                        Text("LOGIN")
                            .font(.largeTitle)
                            .font(.system(size: 30))
                            .foregroundColor(Color(red: 0.596, green: 0.694, blue: 0.769))
                            .fontWeight(.bold)
                            .padding()
                            .padding(.bottom)
                        
                        Image("user")
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 40, trailing: 0))
                        
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
                        .offset(y:-30)
                        
                        
                        //Boton de Login
                        Button(action:{
                            
                            if(email == "" || contrasena == ""){
                                //Mpstrar alerta si los campos estan vacios
                                mostrarAlerta = true
                            }else{
                                //Se ejecuta el CREATE de CRUD
                                
                                MenuBool = true
                            }
                            
                        }) {
                            Text("LOGIN")
                                .fontWeight(.bold)
                            
                        }.buttonStyle(FilledButtonStyle())
                            .offset(y: -160)
                            .alert(isPresented: $mostrarAlerta){
                            Alert(title: Text("ERROR"), message: Text("Llene todos los campos"))
                        }
                        if(MenuBool){
                            NavigationLink(destination: MenuAdmin(), isActive: $MenuBool){
                                EmptyView()
                            }.hidden()
                        }

                        NavigationLink(destination: RegisterView(), label: {Text("REGISTER")}).buttonStyle(FilledButtonStyle())
                            .offset(y: -140)
                            .fontWeight(.bold)
                        
                        
                    }.foregroundColor(.white))

            }
            .padding(.top)

            }
                .navigationTitle("").background(Color(red: 0.596, green: 0.694, blue: 0.769)))
            }
    
        }

struct FilledButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 300)
            .background(configuration.isPressed ? Color(white: 1, opacity: 0.5): Color(#colorLiteral(red: 0.596, green: 0.694, blue: 0.769, alpha: 1))) // #98b1c4)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

struct customtitle: View{
    let text: String
    let x: CGFloat
    let y: CGFloat
    let width: CGFloat
    let offX: CGFloat
    let offY: CGFloat
    @State private var fieldValue:String = ""
    var body: some View{
        //Spacer(minLength: 30)
        
        
        Text(text)
            .font(.system(size: 30))
            .fontWeight(.bold)
            .foregroundColor(Color(red: 0.596, green: 0.694, blue: 0.769))
            .offset(x: x, y: y)
            .padding(EdgeInsets(top: 0, leading: 55, bottom: 0, trailing: 0))
        
        Divider()
            .background(Color.white)
            .frame(width: width)
            .offset(x: offX, y: offY)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
