//
//  RecipeView.swift
//  MAD9137_iosApp1_RecipeAssignment
//
//  Created by Terry Wong on 30/10/2024.
//

import SwiftUI

struct RecipeView: View {
    @ObservedObject var model: ListViewModel
    @State private var isEditing: Bool = false
    @State var recipe: Recipe

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                AsyncImage(url: URL(string: recipe.imageURL ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .clipped()

                } placeholder: {}

                Text(recipe.title)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                    .foregroundStyle(Color.blue)

                Text(recipe.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 10)
                    .multilineTextAlignment(.leading)
                    .sheet(isPresented: $isEditing) {
                        EditRecipeView(model: model, recipe: $recipe, isPresented: $isEditing)
                    }

                Divider()

                VStack(alignment: .leading, spacing: 10) {
                    Text("Ingredients")
                        .font(.headline)
                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        Text("✅ \(ingredient)")
                            .padding(.leading, 10)
                    }
                }
                .padding(20)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)

                Divider()

                VStack(alignment: .leading, spacing: 20) {
                    Text("Steps")
                        .font(.headline)
                    ForEach(recipe.steps.indices, id: \.self) { index in
                        Text("\(index + 1). \(recipe.steps[index])")
                            .padding(.leading, 10)
                    }
                }
            }.navigationTitle("Recipe Details")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button("Edit Recipe") {
                        isEditing.toggle()
                    }
                }
        }
        .padding(30)
    }
}

#Preview {
    ListView()
}
