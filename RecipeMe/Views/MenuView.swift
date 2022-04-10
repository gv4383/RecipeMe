//
//  MenuView.swift
//  RecipeMe
//
//  Created by Goyo Vargas on 4/7/22.
//

import SwiftUI

struct MenuView: View {
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    let testRecipes = [
        TestRecipe(name: "Test Recipe"),
        TestRecipe(name: "Test Recipe"),
        TestRecipe(name: "Test Recipe"),
        TestRecipe(name: "Test Recipe"),
        TestRecipe(name: "Test Recipe"),
        TestRecipe(name: "Test Recipe"),
        TestRecipe(name: "Test Recipe"),
        TestRecipe(name: "Test Recipe"),
        TestRecipe(name: "Test Recipe"),
        TestRecipe(name: "Test Recipe"),
    ]
    
    var body: some View {
        VStack {
            Button("Test") {
                print("Creating new recipe...")
            }
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(testRecipes) { testRecipe in
                        RecipeCardView(recipe: testRecipe)
                    }
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
