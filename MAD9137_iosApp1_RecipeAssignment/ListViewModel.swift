//
//  RecipeModel.swift
//  MAD9137_iosApp1_RecipeAssignment
//
//  Created by Terry Wong on 30/10/2024.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    init() {
        recipes = [
            Recipe(title: "Spaghetti Carbonara",
                   description: """
                   A classic Italian pasta dish made with simple ingredients. This creamy sauce is rich and satisfying, perfect for a comforting dinner.
                   """,
                   ingredients: [
                       "400g Spaghetti",
                       "2 large Eggs (preferably organic)",
                       "150g Pancetta or Guanciale (Italian cured meat)",
                       "100g Parmesan Cheese (freshly grated)",
                       "Black Pepper (freshly cracked)",
                       "Salt (for pasta water)"
                   ],
                   steps: [
                       "Cook the spaghetti in a pot of boiling salted water until al dente, about 8-10 minutes. Reserve 1 cup of pasta water before draining.",
                       "In a large skillet, fry the pancetta over medium heat until crispy, about 4-5 minutes.",
                       "In a mixing bowl, whisk together the eggs and grated Parmesan cheese until smooth.",
                       "Remove the skillet from heat and add the drained spaghetti, mixing quickly to combine with the pancetta.",
                       "Immediately pour in the egg and cheese mixture, stirring rapidly to create a creamy sauce. Add reserved pasta water as needed to achieve desired consistency.",
                       "Season generously with freshly cracked black pepper, serve immediately with extra Parmesan on top."
                   ]),
            
            Recipe(title: "Chicken Alfredo",
                   description: """
                   A rich and creamy pasta dish featuring fettuccine noodles and tender chicken. This indulgent meal is quick to prepare and incredibly delicious.
                   """,
                   ingredients: [
                       "300g Fettuccine",
                       "2 Chicken Breasts (sliced into strips)",
                       "200ml Heavy Cream",
                       "100g Parmesan Cheese (grated)",
                       "2 cloves Garlic (minced)",
                       "2 tablespoons Olive Oil",
                       "Salt and Pepper (to taste)"
                   ],
                   steps: [
                       "Cook the fettuccine according to package instructions until al dente. Drain and set aside.",
                       "In a skillet, heat olive oil over medium-high heat. Add the sliced chicken and season with salt and pepper. Cook until golden brown, about 5-7 minutes.",
                       "Add minced garlic to the skillet and sauté for 1 minute until fragrant.",
                       "Pour in the heavy cream and bring to a gentle simmer. Stir in the grated Parmesan cheese until melted and creamy.",
                       "Add the cooked fettuccine to the sauce, tossing to coat evenly. Serve hot with additional Parmesan cheese on top."
                   ]),
            
            Recipe(title: "Beef Stroganoff",
                   description: """
                   A comforting dish of tender beef cooked in a creamy mushroom sauce, served over egg noodles. This hearty meal is perfect for cold evenings.
                   """,
                   ingredients: [
                       "500g Beef Strips (sirloin or tenderloin)",
                       "200g Mushrooms (sliced)",
                       "1 Onion (finely chopped)",
                       "200g Sour Cream",
                       "50g Butter",
                       "2 tablespoons Flour",
                       "1 cup Beef Broth",
                       "Salt and Pepper (to taste)",
                       "Egg Noodles (for serving)"
                   ],
                   steps: [
                       "In a skillet, melt the butter over medium heat. Add the beef strips and brown on all sides, then remove and set aside.",
                       "In the same skillet, add chopped onions and sauté until translucent. Add sliced mushrooms and cook until softened.",
                       "Sprinkle flour over the vegetables and stir to combine. Gradually pour in beef broth, stirring until thickened.",
                       "Return the beef to the skillet and stir in the sour cream. Cook for a few minutes until heated through.",
                       "Serve the stroganoff over cooked egg noodles, garnished with fresh parsley if desired."
                   ]),
            
            Recipe(title: "Margherita Pizza",
                   description: """
                   A simple yet delicious pizza topped with fresh mozzarella, tomatoes, and basil. This Italian classic is perfect for a casual dinner.
                   """,
                   ingredients: [
                       "Pizza Dough (store-bought or homemade)",
                       "200g Tomato Sauce (preferably San Marzano tomatoes)",
                       "150g Fresh Mozzarella Cheese (sliced)",
                       "Fresh Basil Leaves",
                       "Olive Oil (for drizzling)",
                       "Salt (to taste)"
                   ],
                   steps: [
                       "Preheat your oven to 250°C (482°F) and place a pizza stone inside if you have one.",
                       "Roll out the pizza dough on a floured surface to your desired thickness.",
                       "Spread a thin layer of tomato sauce over the dough, leaving a border for the crust.",
                       "Arrange sliced mozzarella evenly over the sauce and season with a pinch of salt.",
                       "Bake the pizza in the hot oven for about 10-12 minutes until the crust is golden and the cheese is bubbling.",
                       "Remove from the oven and top with fresh basil leaves and a drizzle of olive oil before serving."
                   ]),
            
            Recipe(title: "Tandoori Chicken",
                   description: """
                   Flavorful grilled chicken marinated in yogurt and spices. This dish is a staple of Indian cuisine and is perfect for summer barbecues.
                   """,
                   ingredients: [
                       "500g Chicken (legs or breasts)",
                       "200g Plain Yogurt",
                       "2 cloves Garlic (minced)",
                       "1 inch Ginger (grated)",
                       "2 tablespoons Tandoori Masala",
                       "1 tablespoon Lemon Juice",
                       "Salt (to taste)",
                       "Fresh Cilantro (for garnish)"
                   ],
                   steps: [
                       "In a bowl, mix yogurt, minced garlic, grated ginger, tandoori masala, lemon juice, and salt to make a marinade.",
                       "Coat the chicken thoroughly in the marinade and refrigerate for at least 2 hours, preferably overnight.",
                       "Preheat your grill to medium-high heat.",
                       "Grill the marinated chicken for 15-20 minutes, turning occasionally, until cooked through and slightly charred.",
                       "Garnish with fresh cilantro before serving, and enjoy with naan or rice."
                   ]),
            
            Recipe(title: "Caprese Salad",
                   description: """
                   A fresh and vibrant salad made with ripe tomatoes, creamy mozzarella, and fragrant basil. Drizzled with olive oil, it's a perfect starter.
                   """,
                   ingredients: [
                       "3 Ripe Tomatoes (sliced)",
                       "250g Fresh Mozzarella Cheese (sliced)",
                       "Fresh Basil Leaves",
                       "Olive Oil (for drizzling)",
                       "Balsamic Vinegar (optional)",
                       "Salt and Pepper (to taste)"
                   ],
                   steps: [
                       "On a large platter, alternate slices of tomatoes and mozzarella cheese.",
                       "Tuck fresh basil leaves between the layers.",
                       "Drizzle with olive oil and balsamic vinegar if using.",
                       "Season with salt and pepper to taste, then serve immediately."
                   ]),
            
            Recipe(title: "Beef Tacos",
                   description: """
                   Delicious and satisfying tacos filled with seasoned ground beef, fresh toppings, and wrapped in crispy taco shells. Perfect for a casual meal.
                   """,
                   ingredients: [
                       "500g Ground Beef",
                       "8 Taco Shells",
                       "1 cup Lettuce (shredded)",
                       "1 Tomato (diced)",
                       "100g Cheddar Cheese (shredded)",
                       "Sour Cream (for serving)",
                       "Taco Seasoning (to taste)"
                   ],
                   steps: [
                       "In a skillet over medium heat, cook the ground beef until browned, draining any excess fat.",
                       "Add taco seasoning to the beef according to package instructions, stirring to combine.",
                       "Warm taco shells in the oven according to package instructions.",
                       "Fill each taco shell with seasoned beef and top with shredded lettuce, diced tomatoes, and cheese.",
                       "Serve with a dollop of sour cream on top."
                   ]),
            
            Recipe(title: "Vegetable Stir-Fry",
                   description: """
                   A quick and healthy stir-fry featuring vibrant vegetables, seasoned with soy sauce and ginger. Perfect for a light lunch or dinner.
                   """,
                   ingredients: [
                       "1 cup Broccoli florets",
                       "1 cup Bell Peppers (sliced)",
                       "2 Carrots (sliced thinly)",
                       "2 tablespoons Soy Sauce",
                       "1 teaspoon Fresh Ginger (grated)",
                       "2 tablespoons Vegetable Oil",
                       "Sesame Seeds (for garnish)"
                   ],
                   steps: [
                       "Heat vegetable oil in a large skillet or wok over medium-high heat.",
                       "Add grated ginger and sauté for 30 seconds until fragrant.",
                       "Add the broccoli, bell peppers, and carrots, stir-frying for about 5-7 minutes until tender-crisp.",
                       "Pour in soy sauce and toss to coat the vegetables evenly.",
                       "Serve hot, garnished with sesame seeds."
                   ]),
            
            Recipe(title: "Chocolate Chip Cookies",
                   description: """
                   Classic homemade cookies loaded with chocolate chips. These cookies are soft, chewy, and perfect for any occasion.
                   """,
                   ingredients: [
                       "250g All-Purpose Flour",
                       "150g Granulated Sugar",
                       "150g Brown Sugar",
                       "150g Unsalted Butter (softened)",
                       "1 Egg",
                       "1 teaspoon Vanilla Extract",
                       "200g Chocolate Chips",
                       "1 teaspoon Baking Soda",
                       "1/2 teaspoon Salt"
                   ],
                   steps: [
                       "Preheat your oven to 180°C (350°F). Line a baking sheet with parchment paper.",
                       "In a large bowl, cream together softened butter, granulated sugar, and brown sugar until light and fluffy.",
                       "Beat in the egg and vanilla extract until well combined.",
                       "In a separate bowl, mix together flour, baking soda, and salt. Gradually add this dry mixture to the wet ingredients, mixing until just combined.",
                       "Fold in the chocolate chips.",
                       "Drop tablespoon-sized balls of dough onto the prepared baking sheet, spacing them about 2 inches apart.",
                       "Bake for 10-12 minutes until the edges are golden. Allow to cool before serving."
                   ])
        ]
    }
}
