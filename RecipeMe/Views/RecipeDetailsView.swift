//
//  RecipeDetailsView.swift
//  RecipeMe
//
//  Created by Goyo Vargas on 5/1/22.
//

import SwiftUI

struct RecipeDetailsView: View {
    let name: String
    let totalTime: Int
    let recipeDescription: String
    let ingredients: String
    let steps: String
    
    var body: some View {
        VStack {
            HStack {
                Text(name)
                    .font(.largeTitle)
                    .bold()
                
                Spacer()
                
                TotalTimeView(totalTime: totalTime)
            }
            .padding([.top, .horizontal])
            
            VStack(alignment: .leading) {
                Text("Description")
                    .bold()
                    .padding(.bottom)
                
                Text(recipeDescription)
                    .padding(.bottom)
                
                Text("Ingredients")
                    .bold()
                    .padding(.bottom)
                
                Text(ingredients)
                    .padding(.bottom)
                
                Text("Steps")
                    .bold()
                    .padding(.bottom)
                
                Text(steps)
                    .padding(.bottom)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
    }
}

struct RecipeDetailsView_Previews: PreviewProvider {
    static let name = "Fried Rice"
    static let totalTime = 30
    static let recipeDescription = "A simple and quick recipe for nights where you don't feel like spending too much time on cooking."
    static let ingredients = "Cooking oil as needed\n2 cups of pre-cooked rice (1-2 day old cooked rice preferred)\n1 cup of pork\n1 quarter to half an onion\n3 cloves of garlic\n1 cup of carrots\n1 egg\n1 tsp of soy sauce\n1 tsp of fish sauce\n1 tsp of black soy sauce\n1 tsp of sugar"
    static let steps = "Heat wok/pan over medium-high heat\nCut pork into bite-size pieces\nPour oil into wok/pan, toss pork in, and cook until one side is browned\nRemove meat from wok/pan\nDice onions, garlic, and carrots\nAdd more oil along with onions and garlic\nCook onions/garlic for a few minutes\nPut egg in and scramble\nAdd carrots and cook for a minute or 2\nAdd rice to wok/pan and break it apart\nAdd meat back in and mix everything together\nAdd soy sauce, fish sauce, black soy sauce, and sugar\nMix everything together and cook for 3-5 minutes\nServe on plate and eat"
    
    static var previews: some View {
        RecipeDetailsView(
            name: name,
            totalTime: totalTime,
            recipeDescription: recipeDescription,
            ingredients: ingredients,
            steps: steps
        )
    }
}
