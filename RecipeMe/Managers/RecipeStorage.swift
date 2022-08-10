//
//  RecipeStorage.swift
//  RecipeMe
//
//  Created by Goyo Vargas on 3/26/22.
//

import Combine
import CoreData
import UIKit

final class RecipeStorage: NSObject, ObservableObject {
    var recipes = CurrentValueSubject<[Recipe], Never>([])
    private let recipeFetchController: NSFetchedResultsController<Recipe>
    private let context: NSManagedObjectContext
    static let shared = RecipeStorage()
    
    private override init() {
        context = DataController.shared.container.viewContext
        
        let fetchRequest = Recipe.fetchRequest()
        fetchRequest.sortDescriptors = []
        
        recipeFetchController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: context,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        
        super.init()
        
        recipeFetchController.delegate = self
        
        do {
            try recipeFetchController.performFetch()
            recipes.value = recipeFetchController.fetchedObjects ?? []
        } catch {
            print("Error, could not fetch recipes: \(error.localizedDescription)")
        }
    }
    
    func saveRecipe() throws {
        try context.save()
    }
    
    func create(
        name: String,
        recipeDescription: String,
        ingredients: String,
        steps: String,
        totalTime: Int
    ) throws {
        let newRecipe = Recipe(context: context)
        newRecipe.createdAt = Date()
        newRecipe.id = UUID()
        newRecipe.name = name
        newRecipe.recipeDescription = recipeDescription
        newRecipe.ingredients = ingredients
        newRecipe.steps = steps
        newRecipe.totalTime = Int16(totalTime)
        newRecipe.recipeImage = UIImage(named: "FoodPlaceholder")!.jpegData(compressionQuality: 0.1)
        
        try saveRecipe()
    }
    
    func update(
        withId id: UUID,
        name: String,
        recipeDescription: String,
        ingredients: String,
        steps: String,
        totalTime: Int,
        recipeImage: Data
    ) throws {
        let recipe = recipes.value.first { recipe in
            recipe.id == id
        }!
        recipe.name = name
        recipe.recipeDescription = recipeDescription
        recipe.ingredients = ingredients
        recipe.steps = steps
        recipe.totalTime = Int16(totalTime)
        recipe.recipeImage = recipeImage
        
        try saveRecipe()
    }
    
    func destroy(withId id: UUID) throws {
        let recipe = recipes.value.first { recipe in
            recipe.id == id
        }!
        context.delete(recipe)
        
        try saveRecipe()
    }
}

extension RecipeStorage: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let recipes = controller.fetchedObjects as? [Recipe] else { return }
        print("Context has changed. Reloading recipes.")
        
        self.recipes.value = recipes
    }
}
