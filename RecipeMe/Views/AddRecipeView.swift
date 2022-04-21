//
//  AddRecipeView.swift
//  RecipeMe
//
//  Created by Goyo Vargas on 4/15/22.
//

import SwiftUI

struct AddRecipeView: View {
    @StateObject private var viewModel = AddRecipeViewModel()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
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
                    Picker("Total Prep + Cook Time", selection: $viewModel.time) {
                        ForEach(0 ..< 100, id: \.self) {
                            if ($0 == 1) {
                                Text("\($0) minute")
                            } else {
                                Text("\($0) minutes")
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }
                }
                
                ToolbarItem {
                    Button {
                        viewModel.addNewRecipe()
                        dismiss()
                    } label: {
                        Label("Save", systemImage: "checkmark")
                            .labelStyle(.iconOnly)
                    }
                    .disabled(viewModel.name.isEmpty)
                }
            }
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
