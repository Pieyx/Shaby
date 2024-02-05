//
//  Recipe.swift
//  Shaby
//
//  Created by Jood Khoja on 13/07/1445 AH.
//
import SwiftUI

class RecipeViewModel: ObservableObject {
    @Published var isFavorite: Bool = false
}

struct Recipe1: View {
    @StateObject private var viewModel = RecipeViewModel()
    
    @State var serving: Int = 5
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    Image("kabsa").resizable().frame(height: 450).padding(.top, -70)
                    HStack {
                        Button {
                            // Handle back button action
                        } label: {
                            Image(systemName: "arrow.backward.square.fill")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                        }
                        Spacer()
                        
                        Button(action: {
                            share()
                        }) {
                            Image(systemName: "square.and.arrow.up.fill")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, -220)
                }

                HStack {
                    VStack(alignment: .leading) {
                        Text("Chicken Kabsa")
                        Text("Traditional Saudi recipe")
                    }
                    Spacer()

                    Button(action: {
                        viewModel.isFavorite.toggle()

                        // Store the recipe in MyReceipe when liked
                        if viewModel.isFavorite {
                            // Replace the print statement with your logic to store the recipe
                            print("Recipe added to MyReceipe")
                        }
                    }) {
                        Image(systemName: viewModel.isFavorite ? "suit.heart.fill" : "suit.heart")
                            .accessibilityLabel("hi")
                            .font(.title)
                            .foregroundColor(.red) // Change to your desired color
                    }
                }
                .padding(.top)
                .padding(.horizontal, 20)

                HStack {
                    VStack {
                        Image(systemName: "flame")
                        Text("Easy")
                    }
                    Spacer()
                    VStack {
                        Image(systemName: "clock")
                        Text("45min")
                    }
                    Spacer()
                    VStack {
                        Image(systemName: "flame")
                        Text("salty")
                    }
                }
                .padding(.horizontal, 60)
                .padding(.top)

                Stepper("Serving \(serving)", onIncrement: {
                    serving += 1
                }, onDecrement: {
                    if serving != 1 {
                        serving -= 1
                    }
                })
                .padding(.horizontal, 20)
                .padding(.top)

                Text("Ingredients 6")
                    .padding(.leading, -176)
                    .padding(.top)
            }
        }
    }

    func share() {
        guard let urlShare = URL(string: "https://developer.apple.com/xcode/swiftui/") else {
            return
        }
        let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
}

struct Recipe1_Previews: PreviewProvider {
    static var previews: some View {
        Recipe1()
    }
}
