import SwiftUI



struct RegisterView: View {
    ///LO DEL PROFE
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
              viewModel.user.ID = IDUsuario
              self.handleDeleteTapped()
              registerBool = true
          }
          if mode == .edit{
              IDUsuario = viewModel.user.id ?? ""
          }

      }) {
          if mode == .edit{
              Image(systemName: "trash").foregroundColor(Color.red)
          }
      }
    }
    /////LO DEL PROFE FIN
    @State private var IDUsuario = ""
    
    @State private var Genero = ""
    
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
                
                customtitle(text: "INTERFACE REGISTER", x: -49, y: 30, width: 350, offX: -39, offY: 10)
                
                Button(action: {
                    if (viewModel.user.ID == ""){
                        mostrarAlertaVacio = true
                    }else{
                        //Se ejecuta el CREATE de CRUD
                        self.handleDeleteTapped()
                        registerBool = true
                    }
                    if mode == .edit{
                        IDUsuario = viewModel.user.id ?? ""
                    }

                }) {
                    if mode == .edit{
                        Image(systemName: "trash").foregroundColor(Color.red)
                            //.offset(x:160, y: 30)
                    
                    
                    }
                }
                Form{
                    TextField("ID", text: $viewModel.user.ID)
                    Section{
                        TextField("NAME", text: $viewModel.user.Name)
                    }
                    Section{
                        TextField("LAST NAME", text: $viewModel.user.LastName)
                    }
                    Section{
                        TextField("AGE", text: $viewModel.user.Age)
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
                        TextField("EMAIL", text: $viewModel.user.Email)
                    }
                    Section{
                        SecureField("PASSWORD", text: $viewModel.user.Password)
                    }
                    
                    
                    
                }.padding()
                 .scrollContentBackground(.hidden)
                 .navigationBarItems(
                   trailing: deleteButton
                 )//FORM
                 
                
                
                Button(action:{
                    //print(selectedOption)
                    if(selectedOption == 0){
                        viewModel.user.Gender = "Masculino"
                    }
                    else{
                        viewModel.user.Gender = "Femenino"
                    }
                    if(viewModel.user.ID == "" || viewModel.user.Name == "" || viewModel.user.LastName == "" || viewModel.user.Age == "" || viewModel.user.Gender == "" || viewModel.user.Email == "" || viewModel.user.Password == ""){
                        //Mpstrar alerta si los campos estan vacios
                        mostrarAlertaVacio = true
                    }else{
                        //Se ejecuta el CREATE de CRUD
                        if (mode == .new){
                            viewModel.user.id = viewModel.user.ID
                        }
                        
                        self.handleDoneTapped()
                        //registerBool = true
                    }
                }) {
                    Text(mode == .new ? "REGISTER" : "SAVE")
                        .fontWeight(.bold)
                    
                }.buttonStyle(FilledButtonStyle()).alert(isPresented: $mostrarAlertaVacio){//BOTON
                    Alert(title: Text("ERROR"), message: Text("Llene todos los campos"))
                }//style
                
                if(registerBool){
                    NavigationLink(destination: MenuAdmin(), isActive: $registerBool){
                        EmptyView()
                    }.hidden()
                }//if
                
            }
        }
    }
    
    // Action Handlers
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
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
