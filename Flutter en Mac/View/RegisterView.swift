//
//  RegisterView.swift
//  Flutter en Mac
//
//  Created by ISSC_611_2023 on 26/04/23.
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
    
    @Environment(\.presentationMode) private var presentationMode
    @State var presentActionSheet = false
     
    //VIewModel
    @ObservedObject var viewModel = UserViewModels()
    var mode: Mode = .new
    var completionHandler: ((Result<Action, Error>) -> Void)?
    
    var deleteButton: some View {
        /*if mode == .edit {
          
        }*/
      Button(action: {
          if (IDUsuario == ""){
              mostrarAlertaVacio = true
          }else{
              //Se ejecuta el CREATE de CRUD
              viewModel.user.id = IDUsuario
              /*self.presentActionSheet.toggle()*/
              registerBool = true
          }

      }) {
          if mode == .edit{
              Text("Delete")
          }
      }
    }
    
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
                        TextField("NAME", text: $viewModel.user.name)
                    }
                    Section{
                        TextField("LAST NAME", text: $viewModel.user.lastName)
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
                 .navigationBarItems(
                   trailing: deleteButton
                 )
                 .actionSheet(isPresented: $presentActionSheet) {
                   ActionSheet(title: Text("Are you sure?"),
                               buttons: [
                                 .destructive(Text("Delete Movie"),
                                              action: { self.handleDeleteTapped() }),
                                 .cancel()
                               ])
                 }
                
                Button(action:{
                    print(selectedOption)
                    Genero = String(selectedOption)
                    if(IDUsuario == "" || viewModel.user.name == "" || viewModel.user.lastName == "" || Edad == "" || Genero == "" || Email == "" || Contrasena == "" || Rol == ""){
                        //Mpstrar alerta si los campos estan vacios
                        mostrarAlertaVacio = true
                    }else{
                        //Se ejecuta el CREATE de CRUD
                        viewModel.user.id = IDUsuario
                        //self.handleDoneTapped()
                        registerBool = true
                    }
                }) {
                    Text(mode == .new ? "REGISTER" : "SAVE")
                        .fontWeight(.bold)
                    
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
    
    
    
    // Action Handlers
    /*
    func handleDoneTapped() {
      self.viewModel.handleDoneTapped()
      self.dismiss()
    }
     
    func handleDeleteTapped() {
      viewModel.handleDeleteTapped()
      self.dismiss()
      self.completionHandler?(.success(.delete))
    }
     
    func dismiss() {
      self.presentationMode.wrappedValue.dismiss()
    }
    */
}





    


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
