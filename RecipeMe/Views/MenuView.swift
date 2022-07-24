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
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    viewModel.isShowingAddRecipeView = true
                } label: {
                    Label("Create", systemImage: "plus")
                        .labelStyle(.iconOnly)
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
