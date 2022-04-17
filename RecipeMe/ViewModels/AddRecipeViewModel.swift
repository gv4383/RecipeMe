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
        print("New recipe (\(name)) added!")
    }
}
