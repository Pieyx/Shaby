//
//  Settings.swift
//  Shaby
//
//  Created by NorahAlmukhlifi on 24/07/1445 AH.
//

import SwiftUI

struct Settings: View {
    @State var isOn = false
    var body: some View {
        NavigationStack{
            VStack {
                ZStack{
                    Color.page
                        .ignoresSafeArea()
                    
                    Rectangle()
                        .frame(width: 350, height: 600)
                        .foregroundColor(.page)
                        .cornerRadius(38)
                    VStack {
                        HStack{
                            Image(systemName: "bell")
                                .padding(.horizontal, 16.0)
                            
                            Text("Notifications")
                                .padding(.leading, -16.0)
                            Toggle("",isOn: $isOn)
                                .padding(20)
                                .tint(Color.brown)}
                        NavigationLink(destination : AboutTheApp()){
                            Image(systemName: "doc.text")
                                .foregroundColor(.black)
                            Text("About The App")
                                .foregroundColor(.black)
                               Spacer()
                        }  .padding(.horizontal)
                        
                        NavigationLink(destination : PrivacyPolicy()){
                            Image(systemName: "checkmark.shield")
                            
                                .foregroundColor(.black)
                            Text("Privacy Policy")
                                .foregroundColor(.black)
                           Spacer()
                        } .padding()
                       
                    }
                }.padding()
                    .navigationTitle("Settings")
            }
        }
        .padding(.leading, 11.0)
    }
}

#Preview {
    Settings()
}
