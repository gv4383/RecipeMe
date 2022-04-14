//
//  RecipeView.swift
//  RecipeMe
//
//  Created by Goyo Vargas on 4/10/22.
//

import SwiftUI

struct RecipeView: View {
    let recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(height: 300)
            .background(
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            Color(.gray).opacity(0.3),
                            Color(.gray)
                        ]
                    ),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            
            VStack {
                HStack {
                    Text(recipe.name ?? "N/A")
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                    
                    Text("Time")
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text("Description")
                    
                    Text("Ingredients")
                    
                    Text("Steps")
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
        }
        .navigationBarHidden(true)
        .ignoresSafeArea(.container, edges: .top)
    }
}

struct RecipeView_Previews: PreviewProvider {
    static let context = DataController.preview.container.viewContext
    
    static var previews: some View {
        let recipe = Recipe(context: context)
        recipe.createdAt = Date()
        recipe.id = UUID()
        recipe.name = "Test Name"
        
        return NavigationView {
            RecipeView(recipe: recipe)
        }
    }
}
