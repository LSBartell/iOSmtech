//
//  RecipeDetailView.swift
//  Recipe Tracker (Navigation Lab)
//
//  Created by Jane Madsen on 10/8/25.
//

import SwiftUI

struct RecipeDetailScreen: View {
    @Binding var recipe: Recipe
    @State var showEditRecipeScreen = false
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(recipe.title)
                    .font(.largeTitle)
                    .bold()

                Text("**Ingredients**")
                    .font(.headline)
                Text(recipe.ingredients)

                Text("**Instructions**")
                    .font(.headline)
                Text(recipe.instructions)

                Spacer()
                NavigationStack {
                    Button {
                        showEditRecipeScreen = true
                    } label: {
                        Text("✏️")
                            .padding()
                            .background(
                                Circle()
                                    .foregroundStyle(.green)
                            )
                    }
                }
                .sheet(isPresented: $showEditRecipeScreen) {
                    EditRecipeScreen(recipe: $recipe)
                }
            }
            .padding()
        }
        .navigationTitle(recipe.title)
    }
}
