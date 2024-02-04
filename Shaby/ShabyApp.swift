//
//  ShabyApp.swift
//  Shaby
//
//  Created by Jood Khoja on 11/07/1445 AH.
//

import SwiftUI

struct OnboardingView: View {
    @State private var logoScale: CGFloat = 1.0
    @State private var hasAnimated = false
    
    var body: some View {
        ZStack {
            Color("page") // Set the background color
                .ignoresSafeArea()
            
            VStack {
                Text("Zebdya")
                    .fontWeight(.bold)
                    .foregroundColor(Color("orange1"))
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding(.top, 130.0)
                Text("Discover Saudi Food ")
                    .foregroundColor(.black)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(.top, 1.0)
                
                Image("logo") // Replace "your_logo" with the actual name of your logo asset
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300 * logoScale, height: 300 * logoScale)
                    .animation(Animation.easeInOut(duration: 1.0)) // Remove repeatForever(autoreverses: true)
                    .onAppear() {
                        if !hasAnimated {
                            self.logoScale = 1.2
                            hasAnimated = true
                        }
                    }
                
                Spacer()
                
                NavigationLink(destination: ContentView()) {
                    Text("Get Cooking")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color("page"))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 50)
                            .foregroundColor(Color("orange1")))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.bottom, 60
                    )
                        .padding(.trailing, 50)
                }
            }
            .ignoresSafeArea()
        }
    }
    
    
    @main
    struct ShabyApp: App {
        var body: some Scene {
            WindowGroup {
                OnboardingView() // Change Recipe() to OnboardingView()
            }
        }
    }}

#Preview{ OnboardingView()}
