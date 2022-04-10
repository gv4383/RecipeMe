//
//  RecipeCard.swift
//  RecipeMe
//
//  Created by Goyo Vargas on 3/2/22.
//

import SwiftUI

struct RecipeCardView: View {
    let recipe: TestRecipe
    
    var body: some View {
        VStack {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40, alignment: .center)
                .foregroundColor(.white.opacity(0.7))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(alignment: .bottom) {
                    Text(recipe.name)
                        .font(.headline)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 3, x: 0, y: 0)
                        .frame(maxWidth: 136)
                        .padding()
                }
        }
        .frame(width: 160, height: 217, alignment: .top)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(.gray).opacity(0.3),
                    Color(.gray)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 10)
        .padding(.bottom)
    }
}

struct RecipeCardView_Previews: PreviewProvider {
    static var recipe = TestRecipe(name: "Test Recipe")
    
    static var previews: some View {
        RecipeCardView(recipe: recipe)
    }
}

struct TestRecipe: Identifiable {
    let createdAt = Date()
    let id = UUID()
    let name: String
}
