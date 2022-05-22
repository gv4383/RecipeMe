//
//  RecipeView.swift
//  RecipeMe
//
//  Created by Goyo Vargas on 4/10/22.
//

import SwiftUI

struct RecipeView: View {
    @StateObject private var viewModel = RecipeViewModel()
    
    let recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(height: 300)
            .background(
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            Color(.gray).opacity(0.3),
                            Color(.gray)
                        ]
                    ),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            
            VStack(alignment: .leading) {
                RecipeDetails(
                    name: recipe.name ?? "N/A",
                    totalTime: Int(recipe.totalTime),
                    recipeDescription: recipe.recipeDescription ?? "N/A",
                    ingredients: recipe.ingredients ?? "N/A",
                    steps: recipe.steps ?? "N/A"
                )
            }
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(20, corners: [.topLeft, .topRight])
            .offset(y: -32)
        }
        .ignoresSafeArea(.container, edges: [.top, .bottom])
        .toolbar {
            ToolbarItem {
                Button {
                    if let recipeId = recipe.id {
                        viewModel.removeRecipe(withId: recipeId)
                    }
                } label: {
                    Label("Delete", systemImage: "trash")
                        .labelStyle(.iconOnly)
                }
            }
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static let context = DataController.preview.container.viewContext
    
    static var previews: some View {
        let recipe = Recipe(context: context)
        recipe.createdAt = Date()
        recipe.id = UUID()
        recipe.name = "Fried Rice"
        recipe.totalTime = 30
        recipe.recipeDescription = "A simple and quick recipe for nights where you don't feel like spending too much time on cooking."
        recipe.ingredients = "Cooking oil as needed\n2 cups of pre-cooked rice (1-2 day old cooked rice preferred)\n1 cup of pork\n1 quarter to half an onion\n3 cloves of garlic\n1 cup of carrots\n1 egg\n1 tsp of soy sauce\n1 tsp of fish sauce\n1 tsp of black soy sauce\n1 tsp of sugar"
        recipe.steps = "Heat wok/pan over medium-high heat\nCut pork into bite-size pieces\nPour oil into wok/pan, toss pork in, and cook until one side is browned\nRemove meat from wok/pan\nDice onions, garlic, and carrots\nAdd more oil along with onions and garlic\nCook onions/garlic for a few minutes\nPut egg in and scramble\nAdd carrots and cook for a minute or 2\nAdd rice to wok/pan and break it apart\nAdd meat back in and mix everything together\nAdd soy sauce, fish sauce, black soy sauce, and sugar\nMix everything together and cook for 3-5 minutes\nServe on plate and eat"
        
        return NavigationView {
            RecipeView(recipe: recipe)
        }
    }
}
