//
//  AddRecipeViewModel.swift
//  RecipeMe
//
//  Created by Goyo Vargas on 4/15/22.
//

import Foundation

final class AddRecipeViewModel: ObservableObject {
    @Published var name = ""
    @Published var description = ""
    @Published var ingredients = ""
    @Published var steps = ""
    @Published var time = 0
}
