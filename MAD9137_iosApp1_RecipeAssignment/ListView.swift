//
//  ContentView.swift
//  MAD9137_iosApp1_RecipeAssignment
//
//  Created by Terry Wong on 30/10/2024.
//

import SwiftUI

struct Recipe: Identifiable {
    let id: UUID = .init()
    var title: String
    var description: String
    var ingredients: [String]
    var steps: [String]
}

struct ListView: View {
    @ObservedObject var model = ListViewModel()
    @State var isPresented: Bool = false
    @State var title: String = ""
    @State var description: String = ""
    @State var ingredientsInput: String = ""
    @State var stepsInput: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(model.recipes) { recipe in
                        NavigationLink {
                            RecipeView(recipe: recipe)
                        } label: {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(recipe.title)
                                    .font(.headline)
                                    .foregroundColor(.primary)

                                Text(recipe.description)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            .padding()
                        }
                    }
                    .onDelete {
                        indexSet in deleteRows(at: indexSet)
                    }
                }.listStyle(PlainListStyle())
                    .cornerRadius(13)
                    .shadow(radius: 3)
            }
            .padding()
            .background(Color(.systemGray6))
            .navigationTitle("Delicious Recipes")
            .toolbar {
                ToolbarItem {
                    Button {
                        isPresented.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                    }
                }
            }
            .sheet(isPresented: $isPresented) {
                Form {
                    Section(header: Text("Add your own recipe")) {
                        TextField("Recipe Name", text: $title)
                        TextField("Description", text: $description)
                        TextField("Ingredients (comma separated)", text: $ingredientsInput)
                        TextField("Steps (comma separated)", text: $stepsInput)
                    }

                    Button { addRecipe() } label: {
                        Text("Add")
                    }
                    .disabled(title.isEmpty || description.isEmpty || ingredientsInput.isEmpty || stepsInput.isEmpty)
                }.navigationTitle("Add Recipe")
                    .navigationBarItems(trailing: Button("Cancel") {
                        isPresented.toggle()
                    })
            }
        }
    }

    func deleteRows(at offsets: IndexSet) {
        model.recipes.remove(atOffsets: offsets)
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

#Preview {
    ListView()
}
