//
//  EditRecipeScreen.swift
//  Recipe Tracker (Navigation Lab)
//
//  Created by Logan Steven Bartell on 10/8/25.
//

import SwiftUI

struct EditRecipeScreen: View {
   @Binding var recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Edit Recipe")
                    .font(.largeTitle)
                    .bold()
                Text(recipe.title)
                    .font(.title2)

                Text("**Ingredients**")
                    .font(.headline)
                TextField("Ingredients", text: $recipe.ingredients, prompt: Text(recipe.ingredients))

                Text("**Instructions**")
                    .font(.headline)
                TextField("Instructions", text: $recipe.instructions, prompt: Text(recipe.instructions))

                Spacer()
            }
            .padding()
        }
    }
}


