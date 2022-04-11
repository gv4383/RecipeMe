//
//  DataController.swift
//  RecipeMe
//
//  Created by Goyo Vargas on 3/26/22.
//

import CoreData
import Foundation

final class DataController: ObservableObject {
    let container: NSPersistentContainer
    static let shared = DataController()
    static var preview: DataController = {
        let result = DataController(inMemory: true)
//        let viewContext = result.container.viewContext
        
//        for _ in 0..<10 {
//            let newRecipe = Recipe(context: viewContext)
//            newRecipe.createdAt = Date()
//            newRecipe.id = UUID()
//            newRecipe.ingredients = "Test ingredient"
//            newRecipe.name = "Testz"
//            newRecipe.recipeDescription = "Test description"
//            newRecipe.steps = "Test step"
//            newRecipe.totalTime = 8
//        }
//
//        do {
//            try viewContext.save()
//        } catch {
//            // Replace this implementation with code to handle the error appropriately.
//            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//            let nsError = error as NSError
//            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//        }
        
        return result
    }()
    
    
    private init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "RecipeMeModel")
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
