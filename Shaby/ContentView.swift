//
//  ContentView.swift
//  Shaby
//
//  Created by Jood Khoja on 11/07/1445 AH.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Text("Stetings")
                .tabItem { Image(systemName: "gear")
                    Text("Setings")
                }
           ZoomableMapView()
                .tabItem { Image(systemName: "map")
                    Text("map")
                }
            NavigationStack{
                _myrecepis()
            }
                .tabItem { Image(systemName: "rectangle.stack")
                    Text("My Reseips")
                }
            
        } .accentColor(.black)
        
        
        
    }
    }


#Preview {
    ContentView()
}
