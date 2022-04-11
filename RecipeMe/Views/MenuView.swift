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
            Button("Add test recipes") {
                print("Creating new recipe...")
                let context = DataController.shared.container.viewContext
                let recipe = Recipe(context: context)
                recipe.createdAt = Date()
                recipe.id = UUID()
                recipe.name = "Test"
            }
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.recipes) { recipe in
                        RecipeCardView(recipe: recipe)
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
