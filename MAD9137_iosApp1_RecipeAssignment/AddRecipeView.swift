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

    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()

            VStack {
                Form {
                    Section(header: Text("Add your own recipe")) {
                        TextField("Recipe Name", text: $title)
                        TextField("Description", text: $description)
                        TextField("Ingredients (comma separated)", text: $ingredientsInput)
                        TextField("Steps (comma separated)", text: $stepsInput)
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
        model.recipes.append(.init(title: title, description: description, ingredients: ingredients, steps: steps))
        isPresented.toggle()
        resetFields()
    }

    func resetFields() {
        title = ""
        description = ""
        ingredientsInput = ""
        stepsInput = ""
    }
}
