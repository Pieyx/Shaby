//
//  MyReceipe.swift
//  Shaby
//
//  Created by NorahAlmukhlifi on 20/07/1445 AH.
//

import SwiftUI

struct MyReceipe: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.page)
                    .ignoresSafeArea()
                Image("S")
                    .offset(x:-60,y: 70)
            }
        } .navigationTitle("My Recepies")
            .foregroundColor(.blue)
    }
}
    


#Preview {
    NavigationStack{
        MyReceipe()
    }
}
