//
//  RecipeModel.swift
//  MAD9137_iosApp1_RecipeAssignment
//
//  Created by Terry Wong on 30/10/2024.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var gifts: [Gift] = []

    init() {
        gifts = [
            Gift(person: "Terry", description: "A gift for you"),
            Gift(person: "Terry", description: "A gift for you"),
            Gift(person: "Terry", description: "A gift for you"),
        ]
    }
}
