//
//  ContentView.swift
//  MAD9137_iosApp1_RecipeAssignment
//
//  Created by Terry Wong on 30/10/2024.
//

import SwiftUI

struct Gift: Identifiable {
    let id: UUID = .init()
    var person: String
    var description: String
}

struct ListView: View {
    @ObservedObject var model = ListViewModel()
    @State var isPresented: Bool = false
    @State var name: String = ""
    @State var description: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(model.gifts) { gift in
                        NavigationLink {
                            RecipeView(gift: gift)
                        } label: {
                            Text(gift.person)
                                .font(.headline)
                                .foregroundColor(.blue)
                                .padding()
                        }
                    }
                    .onDelete {
                        indexSet in deleteRows(at: indexSet)
                    }
                }
            }
            .padding()
            .navigationTitle("Generous People I know")
            .toolbar {
                ToolbarItem {
                    Button {
                        isPresented.toggle()
                    } label: {
                        Image(systemName: "gift")
                            .foregroundColor(.blue)
                    }
                }
            }
            .sheet(isPresented: $isPresented) {
                TextField("Gift", text: $name)
                    .padding()
                TextField("Description", text: $description)
                    .padding()
                Button {
                    model.gifts.append(.init(person: name, description: description))
                    isPresented.toggle()
                } label: {
                    Text("Add")
                }
                .disabled(name.isEmpty || description.isEmpty)
            }.background(Color.white)
        }
    }

    func deleteRows(at offsets: IndexSet) {
        model.gifts.remove(atOffsets: offsets)
    }
}

#Preview {
    ListView()
}
