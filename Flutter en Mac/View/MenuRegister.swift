//
//  MenuRegister.swift
//  Flutter en Mac
//
//  Created by ISSC_611_2023 on 26/04/23.
//

import SwiftUI

struct MenuRegister: View {
    var body: some View {
        
        
            Color(#colorLiteral(red: 0.224, green: 0.224, blue: 0.224, alpha: 1)).edgesIgnoringSafeArea(.vertical).overlay(
                VStack{
                    Text("MENU")
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                        .offset(y: -280)
                        .foregroundColor(Color(red: 0.596, green: 0.694, blue: 0.769))
                        .offset(x: -160, y: 80)
                        .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
                    
                   Divider()
                        .background(Color.white)
                        .frame(width: 200)
                        .offset(x: -150, y: -220)
                    
                    NavigationLink(destination: RegisterView(), label: {Text("USER")}).padding().buttonStyle(FilledButtonStyle())
                        .fontWeight(.bold)
                    
                    NavigationLink(destination: ProductView(), label: {Text("PRODUCT")}).padding().buttonStyle(FilledButtonStyle())
                        .fontWeight(.bold)
                    
                })
        
    }
}

struct MenuRegister_Previews: PreviewProvider {
    static var previews: some View {
        MenuRegister()
    }
}
