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
    @State private var editImage: String

    init(model: ListViewModel, recipe: Binding<Recipe>, isPresented: Binding<Bool>) {
        self.model = model
        self._recipe = recipe
        self._isPresented = isPresented
        self._editTitle = State(initialValue: "")
        self._editDescription = State(initialValue: "")
        self._editIngredients = State(initialValue: "")
        self._editSteps = State(initialValue: "")
        self._editImage = State(initialValue: "")
    }

    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()

            VStack {
                Form {
                    Section(header: Text("Edit recipe's name")) {
                        TextField("Type the recipe's name", text: $editTitle)
                    }
                    Section(header: Text("Edit description")) {
                        TextField("Describe your dish", text: $editDescription)
                    }
                    Section(header: Text("Edit image URL")) {
                        TextField("Place the image URL", text: $editImage)
                    }
                    Section(header: Text("Edit ingredients")) {
                        TextField("Insert the ingredients (comma separated)", text: $editIngredients)
                            .frame(height: 120)
                    }
                    Section(header: Text("Edit steps")) {
                        TextField("Insert the cooking steps (comma separated)", text: $editSteps)
                            .frame(height: 120)
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
//                    .disabled(editTitle.isEmpty || editDescription.isEmpty || editIngredients.isEmpty || editSteps.isEmpty)

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
        let updatedRecipe = Recipe(title: editTitle.isEmpty ? recipe.title : editTitle, description: editDescription.isEmpty ? recipe.description : editDescription, ingredients: editIngredients.isEmpty ? recipe.ingredients : ingredients, steps: editSteps.isEmpty ? recipe.steps : steps, imageURL: editImage.isEmpty ? recipe.imageURL : editImage)

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
