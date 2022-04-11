//
//  MenuViewModel.swift
//  RecipeMe
//
//  Created by Goyo Vargas on 4/10/22.
//

import Combine
import Foundation

final class MenuViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    private var cancellable: AnyCancellable?
    
    init(recipePublisher: AnyPublisher<[Recipe], Never> = RecipeStorage.shared.recipes.eraseToAnyPublisher()) {
        cancellable = recipePublisher.sink { recipes in
            print("Updating recipes")
            self.recipes = recipes
        }
    }
}
