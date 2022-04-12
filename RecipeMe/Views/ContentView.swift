//
//  ContentView.swift
//  RecipeMe
//
//  Created by Goyo Vargas on 1/26/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            MenuView()
                .navigationTitle(Text("Menu"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
