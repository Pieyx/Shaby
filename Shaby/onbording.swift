//
//  onbording.swift
//  Shaby
//
//  Created by NorahAlmukhlifi on 23/07/1445 AH.
//

import SwiftUI
struct OnbordingStep{
    let image:String
    let title: String
    let desciption: String
}
private let OnbordingSteps = [
    OnbordingStep(image: "onbording1", title: "Explore the Map", desciption: "Tap on the region you wish to taste its dishes to see a list of recipes"),
    OnbordingStep(image: "onbording2", title: "Add Your Touch", desciption: "Try the recipes and share your experience with the community"),
    OnbordingStep(image: "onbording3", title: "Learn About the Recipe", desciption: "Choose a recipe to discover its ingredients and detailed preparation method")
]
struct onbording: View {
   @State private var currentStep = 0
   
    init(){
        UIScrollView.appearance().bounces = false
    }
    @State private var isOnbordingDone = false
    var body: some View {
        VStack{
//            HStack{
//                Spacer()
//                Button(action: {
//                    self .currentStep = OnbordingSteps.count - 1
//                }) {
//                    Text("Skep")
//                        .padding(16)
//                        .foregroundColor(.gray)
//                }
//            }
            
            if isOnbordingDone {
                ContentView()
            } else{
                TabView(selection: $currentStep){
                    ForEach(0..<OnbordingSteps.count){ it in
                        VStack{
                            Image(OnbordingSteps[it].image)
                                .resizable()
                                .frame(width: 350, height: 350)
                            Text(OnbordingSteps[it].title)
                                .font(.title)
                                .bold()
                            Text(OnbordingSteps[it].desciption)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 32)
                                .padding(.top, 16)
                        }
                        .tag(it)
                    }
                }     .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                //            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                HStack{
                    ForEach(0 ..< OnbordingSteps.count){ it in
                        if it == currentStep {
                            Rectangle()
                                .frame(width: 20, height: 10)
                                .cornerRadius(10)
                                .foregroundColor(.braown)
                            
                        } else {
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(.gray)
                        }
                        
                    }}
                .padding(.bottom,24)
                
                Button(action: {
                    if self.currentStep < OnbordingSteps.count - 1 {
                        self.currentStep += 1
                    } else {
                        //Get Started Logic
                        isOnbordingDone = true
                    }
                }) {
                    Text(currentStep < OnbordingSteps.count - 1 ? "Next" : "Get Started")
                        .padding(16)
                        .frame(maxWidth: .infinity)
                        .background(Color .braown)
                        .cornerRadius(16)
                        .padding(.horizontal, 16)
                        .foregroundColor(.white)
                    
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

#Preview {
    onbording()
}


