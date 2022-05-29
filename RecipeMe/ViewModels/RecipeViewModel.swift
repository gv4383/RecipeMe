//
//  RecipeViewModel.swift
//  RecipeMe
//
//  Created by Goyo Vargas on 4/20/22.
//

import Foundation

final class RecipeViewModel: ObservableObject {
    @Published var isShowingPhotoPicker = false
    
    func removeRecipe(withId id: UUID) {
        RecipeStorage.shared.destroy(withId: id)
    }
}
