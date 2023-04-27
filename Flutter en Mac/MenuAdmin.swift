//
//  MenuAdmin.swift
//  Flutter en Mac
//
//  Created by ISSC_611_2023 on 24/04/23.
//

import SwiftUI

struct MenuAdmin: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView{
            Color(#colorLiteral(red: 0.224, green: 0.224, blue: 0.224, alpha: 1)).edgesIgnoringSafeArea(.vertical).overlay(
                VStack{
                    NavigationLink(destination: ContentView(), label: {Text("REGISTER")}).padding().buttonStyle(FilledButtonStyle())
                    
                    NavigationLink(destination: ContentView(), label: {Text("SALES")}).padding().buttonStyle(FilledButtonStyle())
                    
                    NavigationLink(destination: PurchaseView(), label: {Text("PURCHASE")}).padding().buttonStyle(FilledButtonStyle())
                })
        }
    }
}

struct MenuAdmin_Previews: PreviewProvider {
    static var previews: some View {
        MenuAdmin()
    }
}
