//
//  ZoomableMapView2.swift
//  Shaby
//
//  Created by NorahAlmukhlifi on 20/07/1445 AH.
//

import SwiftUI
import InteractiveMap
import CloudKit



struct ZoomableMapView2: View {
    @State private var searchItem = ""
    @State private var isSheetPresented = false
    @State private var zoomScale: CGFloat = 1.0
    @State private var currentScale: CGFloat = 1.0
    @State private var translation: CGSize = .zero
    @State private var clickedPath = PathData()
    var body: some View {
        ZStack {
            
            Color.page.ignoresSafeArea()
            TextField("Looking for a Recipe?",text: $searchItem)
                .padding(15)
                .background(Color(.white))
                .cornerRadius(20)
                .padding(EdgeInsets(top: 10 , leading: 16, bottom: 600,
                                   trailing: 16))
            Image(systemName: "magnifyingglass")
              
                .padding(EdgeInsets(top: 10 , leading: 150, bottom: 600,
                                   trailing: -300))
            ScrollView([.horizontal, .vertical]) {
                VStack {
                    ZStack {
                        Image("country")
                            .resizable()
                            .scaledToFit()
                        
                        InteractiveMap(svgName: "country") { pathData in
                            InteractiveShape(pathData)
                                .initWithAttributes(
                                    .init(
                                        strokeWidth: 0.5,
                                        strokeColor: .white,
                                        background: Color(.braown)
                                    )
                                )
                                .onTapGesture {
                                    clickedPath = pathData
                                    isSheetPresented = true
                                }
                                .scaleEffect(clickedPath == pathData ? 1.4 : 1)
                                .animation(.easeInOut(duration: 0.2), value: clickedPath)
                                .zIndex(clickedPath == pathData ? 2 : 1)
                        }
                        .gesture(
                            MagnificationGesture()
                                .onChanged { value in
                                    zoomScale = value
                                }
                                .onEnded { _ in
                                    currentScale *= zoomScale
                                    zoomScale = 0.2
                                }
                        )
                        .animation(.easeInOut(duration: 0.2))
                    } .sheet(isPresented: $isSheetPresented) {
                        mydish(name: clickedPath.name)
                            .presentationDetents([.medium , .large])
                            .presentationDragIndicator(.hidden)
                    }
                }
            }.padding(.top,150)
        }
    }
}
struct mydish: View {
    let name: String
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack {
                RoundedRectangle(cornerRadius: 3,style: .continuous)
                    .frame(width: 100,height: 5)
                    .padding(8)
                    .foregroundColor(.braown)
                
                Text("\(name)")
                    
                    .foregroundColor(.black)
                    .bold()
                    .font(.title2)
                   
        
                
                Spacer()
            }
         
            .padding()
        }
    }
}

#Preview {
    ZoomableMapView2()
}
