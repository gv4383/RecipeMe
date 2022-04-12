//
//  RecipeView.swift
//  RecipeMe
//
//  Created by Goyo Vargas on 4/10/22.
//

import SwiftUI

struct RecipeView: View {
    let recipe: Recipe
    
    var body: some View {
        Text("Recipe View")
            .navigationTitle(Text(recipe.name ?? "Recipe Name"))
    }
}

struct RecipeView_Previews: PreviewProvider {
    static let context = DataController.preview.container.viewContext
    
    static var previews: some View {
        let recipe = Recipe(context: context)
        recipe.createdAt = Date()
        recipe.id = UUID()
        recipe.name = "Test Name"
        
        return NavigationView {
            RecipeView(recipe: recipe)
        }
    }
}
