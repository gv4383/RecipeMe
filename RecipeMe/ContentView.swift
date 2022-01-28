//
//  ContentView.swift
//  RecipeMe
//
//  Created by Goyo Vargas on 1/26/22.
//

import SwiftUI

struct MenuView: View {
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(0..<10) { _ in
                Text("Menu View")
                    .padding()
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
