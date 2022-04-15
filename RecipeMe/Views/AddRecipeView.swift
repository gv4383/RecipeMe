//
//  AddRecipeView.swift
//  RecipeMe
//
//  Created by Goyo Vargas on 4/15/22.
//

import SwiftUI

struct AddRecipeView: View {
    @StateObject private var viewModel = AddRecipeViewModel()
    
    var body: some View {
        Form {
            Section(header: Text("Name")) {
                TextField("Recipe Name", text: $viewModel.name)
            }
            
            Section(header: Text("Description")) {
                TextEditor(text: $viewModel.description)
            }
            
            Section(header: Text("Ingredients")) {
                TextEditor(text: $viewModel.ingredients)
            }
            
            Section(header: Text("Steps")) {
                TextEditor(text: $viewModel.steps)
            }
            
            Section(header: Text("Time")) {
                Picker("Minutes", selection: $viewModel.time) {
                    ForEach(0 ..< 100, id: \.self) {
                        Text("\($0)")
                    }
                }
            }
        }
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
