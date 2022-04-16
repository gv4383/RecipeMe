//
//  MenuView.swift
//  RecipeMe
//
//  Created by Goyo Vargas on 4/7/22.
//

import CoreData
import SwiftUI

struct MenuView: View {
    @StateObject private var viewModel = MenuViewModel()
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        VStack {
            Button("Add test recipe") {
                print("Creating new recipe...")
                let context = DataController.shared.container.viewContext
                let recipe = Recipe(context: context)
                recipe.createdAt = Date()
                recipe.id = UUID()
                recipe.name = "Fried Rice"
                recipe.totalTime = 30
                recipe.recipeDescription = "A simple and quick recipe for nights where you don't feel like spending too much time on cooking."
                recipe.ingredients = "Cooking oil as needed\n2 cups of pre-cooked rice (1-2 day old cooked rice preferred)\n1 cup of pork\n1 quarter to half an onion\n3 cloves of garlic\n1 cup of carrots\n1 egg\n1 tsp of soy sauce\n1 tsp of fish sauce\n1 tsp of black soy sauce\n1 tsp of sugar"
                recipe.steps = "Heat wok/pan over medium-high heat\nCut pork into bite-size pieces\nPour oil into wok/pan, toss pork in, and cook until one side is browned\nRemove meat from wok/pan\nDice onions, garlic, and carrots\nAdd more oil along with onions and garlic\nCook onions/garlic for a few minutes\nPut egg in and scramble\nAdd carrots and cook for a minute or 2\nAdd rice to wok/pan and break it apart\nAdd meat back in and mix everything together\nAdd soy sauce, fish sauce, black soy sauce, and sugar\nMix everything together and cook for 3-5 minutes\nServe on plate and eat"
            }
            
            Button("Add new recipe") {
                viewModel.isShowingAddRecipeView = true
            }
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.recipes) { recipe in
                        NavigationLink {
                            RecipeView(recipe: recipe)
                        } label: {
                            RecipeCardView(recipe: recipe)
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $viewModel.isShowingAddRecipeView) {
            AddRecipeView()
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
