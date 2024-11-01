//
//  EdieRecipeView.swift
//  MAD9137_iosApp1_RecipeAssignment
//
//  Created by Terry Wong on 31/10/2024.
//

import SwiftUI

struct EditRecipeView: View {
    @ObservedObject var model: ListViewModel
    @Binding var recipe: Recipe
    @Binding var isPresented: Bool
    @State private var editTitle: String
    @State private var editDescription: String
    @State private var editIngredients: String
    @State private var editSteps: String

    init(model: ListViewModel, recipe: Binding<Recipe>, isPresented: Binding<Bool>) {
        self.model = model
        self._recipe = recipe
        self._isPresented = isPresented
        self._editTitle = State(initialValue: "")
        self._editDescription = State(initialValue: "")
        self._editIngredients = State(initialValue: "")
        self._editSteps = State(initialValue: "")
    }

    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()

            VStack {
                Form {
                    Section(header: Text("Edit Recipe")) {
                        TextField("Recipe Name", text: $editTitle)
                        TextField("Description", text: $editDescription)
                        TextField("Ingredients (comma separated)", text: $editIngredients)
                        TextField("Steps (comma separated)", text: $editSteps)
                    }
                }

                HStack {
                    Button {
                        saveChanges()
                    } label: {
                        Text("Save")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .disabled(editTitle.isEmpty || editDescription.isEmpty || editIngredients.isEmpty || editSteps.isEmpty)

                    Button {
                        isPresented.toggle()
                    } label: {
                        Text("Cancel")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                }
                .padding(.top)
            }
            .padding()
        }
    }

    func saveChanges() {
        let ingredients = editIngredients.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
        let steps = editSteps.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
        let updatedRecipe = Recipe(title: editTitle, description: editDescription, ingredients: ingredients, steps: steps)

        if let index = model.recipes.firstIndex(where: { $0.id == recipe.id }) {
            model.recipes[index] = updatedRecipe // Update the recipe in the model
        }

        recipe = updatedRecipe // Update the bound recipe
        isPresented = false // Close the edit view
    }
}

#Preview {
    ListView()
}
