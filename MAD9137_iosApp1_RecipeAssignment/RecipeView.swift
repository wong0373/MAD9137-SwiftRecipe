//
//  RecipeView.swift
//  MAD9137_iosApp1_RecipeAssignment
//
//  Created by Terry Wong on 30/10/2024.
//

import SwiftUI

struct RecipeView: View {
    var gift: Gift
    var body: some View {
        Text(gift.person)
        Text(gift.description)
    }
}
