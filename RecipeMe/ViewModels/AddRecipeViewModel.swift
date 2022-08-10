//
//  AddRecipeViewModel.swift
//  RecipeMe
//
//  Created by Goyo Vargas on 4/15/22.
//

import CoreData
import Foundation

final class AddRecipeViewModel: ObservableObject {
    @Published var name = ""
    @Published var description = ""
    @Published var ingredients = ""
    @Published var steps = ""
    @Published var time = 0
    
    private let context: NSManagedObjectContext
    
    init() {
        context = DataController.shared.container.viewContext
    }
    
    func addNewRecipe() {
        do {
            try RecipeStorage.shared.create(
                name: name,
                recipeDescription: description,
                ingredients: ingredients,
                steps: steps,
                totalTime: time
            )
            
            print("New recipe (\(name)) added!")
        } catch {
            print("Error: there was a problem adding your new recipe")
        }
    }
}
