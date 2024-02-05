//
//  privacyPolicy.swift
//  Shaby
//
//  Created by NorahAlmukhlifi on 24/07/1445 AH.
//
import SwiftUI

struct PrivacyPolicy: View {
    var body: some View {
        ZStack{
            Color.page
                .ignoresSafeArea()
            VStack{
                Text("Privacy Policy")
                    .font(.title)
                    .bold()
                    .offset(x:-10,y: -50)
                    .padding(50)
                Text("Our app provides an exceptional Saudi cuisine experience for cooking enthusiasts who want to learn how to cook Saudi food by using an interactive regional map of Saudi Arabia. Unlike other apps where recipes are presented in a boring way, we provide a fun and engaging experience of Saudi cuisine.")
                    .multilineTextAlignment(.leading)
                    .offset(x:1,y: -100)
                    .font(.title3)
                    .padding()
            }
        }
    }
}

#Preview {
    PrivacyPolicy()
}
