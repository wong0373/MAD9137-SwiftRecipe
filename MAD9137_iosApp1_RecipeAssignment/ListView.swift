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
    @ObservedObject private var model = ListViewModel()
    @State private var isPresented: Bool = false
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var ingredientsInput: String = ""
    @State private var stepsInput: String = ""
    @State private var searchText: String = ""
    @State private var showAlert: Bool = false
    @State private var indexSetToDelete: IndexSet?

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(filteredRecipes) { recipe in
                        NavigationLink {
                            RecipeView(recipe: recipe)
                        } label: {
                            VStack(alignment: .leading, spacing: 10) {
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
                        indexSet in
                        indexSetToDelete = indexSet
                        showAlert = true
                    }

                }.listStyle(PlainListStyle())
                    .cornerRadius(10)
                    .shadow(radius: 1)
                    .padding(.horizontal)
                    .navigationTitle("👨‍🍳Recipes")
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                isPresented.toggle()
                            } label: {
                                Image(systemName: "plus.circle.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(.blue)
                            }
                        }
                    }.searchable(text: $searchText, prompt: "Search by title or ingredient").textInputAutocapitalization(.never)
            }

            .background(Color(.systemGray6))
            .alert("Delete Recipe", isPresented: $showAlert) {
                Button("Delete", role: .destructive) {
                    if let indexSetToDelete = indexSetToDelete {
                        withAnimation {
                            deleteRows(at: indexSetToDelete)
                        }
                    }
                }
                Button("Cancel", role: .cancel) {
                    showAlert = false
                    indexSetToDelete = nil
                }
            } message: {
                Text("Are you sure you want to delete this recipe?")
            }
            .sheet(isPresented: $isPresented) {
                AddRecipeView(model: model, isPresented: $isPresented)
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

    var filteredRecipes: [Recipe] {
        if searchText.isEmpty {
            return model.recipes
        } else {
            return model.recipes.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                    $0.ingredients.joined(separator: ", ").localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}

#Preview {
    ListView()
}
