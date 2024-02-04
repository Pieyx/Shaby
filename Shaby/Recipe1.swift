//
//  Recipe.swift
//  Shaby
//
//  Created by Jood Khoja on 13/07/1445 AH.
//

import SwiftUI

struct Recipe1: View {
    @State var serving: Int = 5
    var body: some View {
        ScrollView{
            VStack{ // page
                ZStack{ // Top of page and image
                    Image("kabsa").resizable().frame(height: 450).padding(.top,-70)
                    HStack{
                        Button{
                            
                        } label: {
                            Image(systemName: "arrow.backward.square.fill")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                        }
                        Spacer()
                        Button{
                            
                        } label: {
                            Image(systemName: "square.and.arrow.up.fill")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                        }
                    }.padding(.horizontal,20)
                    .padding(.vertical,-220)
                } // end of top page
               
                HStack{ // name of recipe
                    VStack(alignment: .leading){
                        Text("Chicken Kabsa")
                            
                        Text("Traditional Saudi recipe")
                    }/*.offset(x:-80)*/
                    Spacer()
                    Button{
                        
                    } label: {
                        Image(systemName: "suit.heart")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                }.padding(.top)
                .padding(.horizontal,20)
                
                
                HStack{ // highlights
                    VStack{
                        Image(systemName: "flame")
                        Text("Easy")
                    }
                    Spacer()
                    VStack{
                        Image(systemName: "clock")
                        Text("45min")
                    }
                    Spacer()
                    VStack{
                        Image(systemName: "flame")
                        Text("salty")
                    }
                }
                .padding(.horizontal,60)
                .padding(.top)
                    
                Stepper ("Serving \(serving)", onIncrement: {
                        serving += 1
                }, onDecrement: {
                    if (serving != 1) {
                        serving -= 1
                    }
                })
                    .padding(.horizontal,20)
                    .padding(.top)
                
                Text("Ingredients 6")
                    .padding(.leading,-176)
                    .padding(.top)
                
            } // end of Page
        }
        
    }
    
}

#Preview {
    Recipe1()
}
