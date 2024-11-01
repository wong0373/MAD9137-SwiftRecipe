//
//  AddRecipeView.swift
//  MAD9137_iosApp1_RecipeAssignment
//
//  Created by Terry Wong on 30/10/2024.
//

import SwiftUI

struct AddRecipeView: View {
    @ObservedObject var model: ListViewModel
    @Binding var isPresented: Bool
    @State var title: String = ""
    @State var description: String = ""
    @State var ingredientsInput: String = ""
    @State var stepsInput: String = ""
    @State var imageURLInput: String = ""

    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()

            VStack {
                Form {
                    Section(header: Text("Recipe Name")) {
                        TextField("Type the recipe's name", text: $title)
                    }
                    Section(header: Text("Description")) {
                        TextField("Describe your dish", text: $description)
                    }
                    Section(header: Text("Image")) {
                        TextField("Place the image URL", text: $imageURLInput)
                    }

                    Section(header: Text("Ingredients")) {
                        TextField("Insert the ingredients (comma separated)", text: $ingredientsInput)
                            .frame(height: 120)
                    }

                    Section(header: Text("Steps")) {
                        TextField("Insert the cooking steps (comma separated)", text: $stepsInput)
                            .frame(height: 120)
                    }
                }

                HStack {
                    Button { addRecipe() } label: {
                        Text("Add")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .disabled(title.isEmpty || description.isEmpty || ingredientsInput.isEmpty || stepsInput.isEmpty)

                    Button { isPresented.toggle() } label: {
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
            }.padding()
        }
    }

    func addRecipe() {
        let ingredients = ingredientsInput.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
        let steps = stepsInput.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
        let newRecipe = Recipe(title: title, description: description, ingredients: ingredients, steps: steps, imageURL: imageURLInput)
        model.recipes.append(newRecipe)
        isPresented.toggle()
        resetFields()
    }

    func resetFields() {
        title = ""
        description = ""
        imageURLInput = ""
        ingredientsInput = ""
        stepsInput = ""
    }
}
