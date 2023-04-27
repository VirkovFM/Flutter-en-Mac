//
//  MenuRegister.swift
//  Flutter en Mac
//
//  Created by ISSC_611_2023 on 26/04/23.
//

import SwiftUI

struct MenuRegister: View {
    var body: some View {
        
        NavigationView{
            Color(#colorLiteral(red: 0.224, green: 0.224, blue: 0.224, alpha: 1)).edgesIgnoringSafeArea(.vertical).overlay(
                VStack{
                    NavigationLink(destination: RegisterView(), label: {Text("USER")}).padding().buttonStyle(FilledButtonStyle())
                    
                    NavigationLink(destination: ProductView(), label: {Text("PRODUCT")}).padding().buttonStyle(FilledButtonStyle())
                    
                })
        }
    }
}

struct MenuRegister_Previews: PreviewProvider {
    static var previews: some View {
        MenuRegister()
    }
}
