//
//  RecipeStorage.swift
//  RecipeMe
//
//  Created by Goyo Vargas on 3/26/22.
//

import Combine
import CoreData
import Foundation

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
}

extension RecipeStorage: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let recipes = controller.fetchedObjects as? [Recipe] else { return }
        print("Context has changed. Reloading recipes.")
        
        self.recipes.value = recipes
    }
}
