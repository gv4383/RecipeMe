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
    
    private init() {
        container = NSPersistentContainer(name: "RecipeMeModel")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
