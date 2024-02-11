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
            
         ZoomableMapView2()
                .tabItem { Image(systemName: "map")
                    Text("map")
                }
          Settings()
                .tabItem { Image(systemName: "gear")
                    Text("Setings")
                }
            NavigationStack{
                MyReceipe()
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
