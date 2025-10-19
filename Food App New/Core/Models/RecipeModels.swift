//
//  RecipeModels.swift
//  Food App New
//
//  Created by Danciu David on 16.10.2025.
//

import Foundation
import Combine

// MARK: - Recipe Models

struct Recipe: Identifiable, Codable {
    let id: Int
    let title: String
    let image: String
    let readyInMinutes: Int
    let servings: Int
    let pricePerServing: Double
    let healthScore: Int
    let diets: [String]
    let cuisines: [String]
    let summary: String
    let instructions: [Instruction]
    let extendedIngredients: [ExtendedIngredient]
    let nutrition: Nutrition
    let isFavorite: Bool
    
    init(id: Int, title: String, image: String, readyInMinutes: Int, servings: Int, pricePerServing: Double, healthScore: Int, diets: [String], cuisines: [String], summary: String, instructions: [Instruction], extendedIngredients: [ExtendedIngredient], nutrition: Nutrition, isFavorite: Bool = false) {
        self.id = id
        self.title = title
        self.image = image
        self.readyInMinutes = readyInMinutes
        self.servings = servings
        self.pricePerServing = pricePerServing
        self.healthScore = healthScore
        self.diets = diets
        self.cuisines = cuisines
        self.summary = summary
        self.instructions = instructions
        self.extendedIngredients = extendedIngredients
        self.nutrition = nutrition
        self.isFavorite = isFavorite
    }
}

struct Instruction: Identifiable, Codable {
    let id: Int
    let step: String
    let number: Int
}

struct ExtendedIngredient: Identifiable, Codable {
    let id: Int
    let name: String
    let amount: Double
    let unit: String
    let image: String
    let original: String
}

struct Nutrition: Codable {
    let calories: Double
    let carbs: Double
    let protein: Double
    let fat: Double
    let fiber: Double
    let sugar: Double
    let sodium: Double
}

// MARK: - Recipe Categories

enum RecipeCategory: String, CaseIterable {
    case healthy = "Healthy"
    case lowCalorie = "Low Calorie"
    case vegan = "Vegan"
    case keto = "Keto"
    case quickEasy = "Quick & Easy"
    case highProtein = "High Protein"
    case glutenFree = "Gluten Free"
    case vegetarian = "Vegetarian"
    
    var icon: String {
        switch self {
        case .healthy: return "leaf.fill"
        case .lowCalorie: return "flame.fill"
        case .vegan: return "carrot.fill"
        case .keto: return "leaf.arrow.circlepath"
        case .quickEasy: return "clock.fill"
        case .highProtein: return "dumbbell.fill"
        case .glutenFree: return "checkmark.circle.fill"
        case .vegetarian: return "leaf.circle.fill"
        }
    }
}

// MARK: - Mock Data

class RecipeDataManager: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var selectedCategory: RecipeCategory? = nil
    @Published var searchText: String = ""
    
    init() {
        loadMockData()
    }
    
    private func loadMockData() {
        recipes = [
            Recipe(
                id: 1,
                title: "Healthy Taco Salad",
                image: "https://images.unsplash.com/photo-1512058564366-18510be2db19?w=400",
                readyInMinutes: 15,
                servings: 4,
                pricePerServing: 2.50,
                healthScore: 85,
                diets: ["vegetarian", "gluten free"],
                cuisines: ["Mexican"],
                summary: "This Healthy Taco Salad is the universal delight of taco night. Packed with fresh vegetables, lean protein, and a zesty dressing, it's a nutritious meal that doesn't compromise on flavor.",
                instructions: [
                    Instruction(id: 1, step: "Wash and chop all vegetables into bite-sized pieces.", number: 1),
                    Instruction(id: 2, step: "Cook ground turkey in a skillet over medium heat until browned.", number: 2),
                    Instruction(id: 3, step: "Add taco seasoning and mix well.", number: 3),
                    Instruction(id: 4, step: "Combine all ingredients in a large bowl and toss with dressing.", number: 4)
                ],
                extendedIngredients: [
                    ExtendedIngredient(id: 1, name: "Ground Turkey", amount: 1, unit: "lb", image: "https://images.unsplash.com/photo-1544025162-d76694265947?w=100", original: "1 lb ground turkey"),
                    ExtendedIngredient(id: 2, name: "Romaine Lettuce", amount: 1, unit: "head", image: "https://images.unsplash.com/photo-1622206151226-18ca2c9ab4a1?w=100", original: "1 head romaine lettuce, chopped"),
                    ExtendedIngredient(id: 3, name: "Cherry Tomatoes", amount: 1, unit: "cup", image: "https://images.unsplash.com/photo-1592924357228-91a4daadcfea?w=100", original: "1 cup cherry tomatoes, halved"),
                    ExtendedIngredient(id: 4, name: "Avocado", amount: 1, unit: "piece", image: "https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?w=100", original: "1 avocado, diced")
                ],
                nutrition: Nutrition(calories: 320, carbs: 18, protein: 28, fat: 16, fiber: 8, sugar: 6, sodium: 420)
            ),
            Recipe(
                id: 2,
                title: "Mediterranean Quinoa Bowl",
                image: "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400",
                readyInMinutes: 25,
                servings: 2,
                pricePerServing: 3.20,
                healthScore: 92,
                diets: ["vegan", "gluten free"],
                cuisines: ["Mediterranean"],
                summary: "A vibrant and nutritious quinoa bowl loaded with Mediterranean flavors. Perfect for a healthy lunch or light dinner.",
                instructions: [
                    Instruction(id: 1, step: "Cook quinoa according to package instructions.", number: 1),
                    Instruction(id: 2, step: "Chop vegetables and prepare the dressing.", number: 2),
                    Instruction(id: 3, step: "Combine all ingredients in a bowl and serve.", number: 3)
                ],
                extendedIngredients: [
                    ExtendedIngredient(id: 1, name: "Quinoa", amount: 1, unit: "cup", image: "https://images.unsplash.com/photo-1586201375761-83865001e31c?w=100", original: "1 cup quinoa"),
                    ExtendedIngredient(id: 2, name: "Cucumber", amount: 1, unit: "piece", image: "https://images.unsplash.com/photo-1449300079323-02e209d9d3a6?w=100", original: "1 cucumber, diced"),
                    ExtendedIngredient(id: 3, name: "Cherry Tomatoes", amount: 1, unit: "cup", image: "https://images.unsplash.com/photo-1592924357228-91a4daadcfea?w=100", original: "1 cup cherry tomatoes"),
                    ExtendedIngredient(id: 4, name: "Kalamata Olives", amount: 0.5, unit: "cup", image: "https://images.unsplash.com/photo-1515443961218-a51367888e4b?w=100", original: "1/2 cup kalamata olives")
                ],
                nutrition: Nutrition(calories: 280, carbs: 42, protein: 12, fat: 8, fiber: 6, sugar: 8, sodium: 320)
            ),
            Recipe(
                id: 3,
                title: "Keto Chicken Stir-Fry",
                image: "https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=400",
                readyInMinutes: 20,
                servings: 3,
                pricePerServing: 4.10,
                healthScore: 78,
                diets: ["keto", "gluten free"],
                cuisines: ["Asian"],
                summary: "A quick and delicious keto-friendly stir-fry that's perfect for busy weeknights. Low in carbs but high in flavor.",
                instructions: [
                    Instruction(id: 1, step: "Cut chicken into bite-sized pieces and season.", number: 1),
                    Instruction(id: 2, step: "Heat oil in a large wok or skillet.", number: 2),
                    Instruction(id: 3, step: "Cook chicken until golden brown.", number: 3),
                    Instruction(id: 4, step: "Add vegetables and stir-fry for 3-4 minutes.", number: 4),
                    Instruction(id: 5, step: "Add sauce and toss everything together.", number: 5)
                ],
                extendedIngredients: [
                    ExtendedIngredient(id: 1, name: "Chicken Breast", amount: 1.5, unit: "lbs", image: "https://images.unsplash.com/photo-1544025162-d76694265947?w=100", original: "1.5 lbs chicken breast, cubed"),
                    ExtendedIngredient(id: 2, name: "Broccoli", amount: 2, unit: "cups", image: "https://images.unsplash.com/photo-1438118907701-1257b46335f4?w=100", original: "2 cups broccoli florets"),
                    ExtendedIngredient(id: 3, name: "Bell Peppers", amount: 2, unit: "pieces", image: "https://images.unsplash.com/photo-1563565375-f3fdfdbefa83?w=100", original: "2 bell peppers, sliced"),
                    ExtendedIngredient(id: 4, name: "Soy Sauce", amount: 3, unit: "tbsp", image: "https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?w=100", original: "3 tbsp soy sauce")
                ],
                nutrition: Nutrition(calories: 180, carbs: 8, protein: 35, fat: 2, fiber: 3, sugar: 4, sodium: 680)
            ),
            Recipe(
                id: 4,
                title: "Vegan Buddha Bowl",
                image: "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400",
                readyInMinutes: 30,
                servings: 2,
                pricePerServing: 2.80,
                healthScore: 95,
                diets: ["vegan", "gluten free"],
                cuisines: ["International"],
                summary: "A colorful and nutritious Buddha bowl packed with plant-based goodness. Perfect for a healthy and satisfying meal.",
                instructions: [
                    Instruction(id: 1, step: "Preheat oven to 400°F and roast sweet potatoes.", number: 1),
                    Instruction(id: 2, step: "Cook quinoa and prepare all vegetables.", number: 2),
                    Instruction(id: 3, step: "Make the tahini dressing.", number: 3),
                    Instruction(id: 4, step: "Arrange all ingredients in bowls and drizzle with dressing.", number: 4)
                ],
                extendedIngredients: [
                    ExtendedIngredient(id: 1, name: "Sweet Potato", amount: 2, unit: "pieces", image: "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=100", original: "2 sweet potatoes, cubed"),
                    ExtendedIngredient(id: 2, name: "Quinoa", amount: 1, unit: "cup", image: "https://images.unsplash.com/photo-1586201375761-83865001e31c?w=100", original: "1 cup quinoa"),
                    ExtendedIngredient(id: 3, name: "Chickpeas", amount: 1, unit: "can", image: "https://images.unsplash.com/photo-1544025162-d76694265947?w=100", original: "1 can chickpeas, drained"),
                    ExtendedIngredient(id: 4, name: "Kale", amount: 2, unit: "cups", image: "https://images.unsplash.com/photo-1622206151226-18ca2c9ab4a1?w=100", original: "2 cups kale, chopped")
                ],
                nutrition: Nutrition(calories: 420, carbs: 65, protein: 18, fat: 12, fiber: 12, sugar: 15, sodium: 280)
            ),
            Recipe(
                id: 5,
                title: "High-Protein Greek Yogurt Parfait",
                image: "https://images.unsplash.com/photo-1488477181946-6428a0291777?w=400",
                readyInMinutes: 10,
                servings: 1,
                pricePerServing: 1.80,
                healthScore: 88,
                diets: ["vegetarian", "gluten free"],
                cuisines: ["Greek"],
                summary: "A protein-packed parfait perfect for breakfast or a post-workout snack. Layers of Greek yogurt, fresh berries, and granola.",
                instructions: [
                    Instruction(id: 1, step: "Layer Greek yogurt in a glass or bowl.", number: 1),
                    Instruction(id: 2, step: "Add fresh berries on top.", number: 2),
                    Instruction(id: 3, step: "Sprinkle with granola and drizzle with honey.", number: 3)
                ],
                extendedIngredients: [
                    ExtendedIngredient(id: 1, name: "Greek Yogurt", amount: 1, unit: "cup", image: "https://images.unsplash.com/photo-1488477181946-6428a0291777?w=100", original: "1 cup Greek yogurt"),
                    ExtendedIngredient(id: 2, name: "Mixed Berries", amount: 0.5, unit: "cup", image: "https://images.unsplash.com/photo-1481349518771-20055b2a7b24?w=100", original: "1/2 cup mixed berries"),
                    ExtendedIngredient(id: 3, name: "Granola", amount: 0.25, unit: "cup", image: "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=100", original: "1/4 cup granola"),
                    ExtendedIngredient(id: 4, name: "Honey", amount: 1, unit: "tbsp", image: "https://images.unsplash.com/photo-1558642084-fd07fae5282e?w=100", original: "1 tbsp honey")
                ],
                nutrition: Nutrition(calories: 280, carbs: 35, protein: 25, fat: 6, fiber: 4, sugar: 28, sodium: 120)
            ),
            Recipe(
                id: 6,
                title: "Gluten-Free Pasta Primavera",
                image: "https://images.unsplash.com/photo-1621996346565-e3dbc353d2e5?w=400",
                readyInMinutes: 35,
                servings: 4,
                pricePerServing: 3.50,
                healthScore: 82,
                diets: ["vegetarian", "gluten free"],
                cuisines: ["Italian"],
                summary: "A light and fresh pasta dish loaded with seasonal vegetables. Perfect for a healthy Italian-inspired meal.",
                instructions: [
                    Instruction(id: 1, step: "Cook gluten-free pasta according to package instructions.", number: 1),
                    Instruction(id: 2, step: "Sauté vegetables in olive oil until tender.", number: 2),
                    Instruction(id: 3, step: "Combine pasta with vegetables and toss with sauce.", number: 3),
                    Instruction(id: 4, step: "Garnish with fresh herbs and serve.", number: 4)
                ],
                extendedIngredients: [
                    ExtendedIngredient(id: 1, name: "Gluten-Free Pasta", amount: 12, unit: "oz", image: "https://images.unsplash.com/photo-1621996346565-e3dbc353d2e5?w=100", original: "12 oz gluten-free pasta"),
                    ExtendedIngredient(id: 2, name: "Zucchini", amount: 2, unit: "pieces", image: "https://images.unsplash.com/photo-1449300079323-02e209d9d3a6?w=100", original: "2 zucchini, sliced"),
                    ExtendedIngredient(id: 3, name: "Bell Peppers", amount: 2, unit: "pieces", image: "https://images.unsplash.com/photo-1563565375-f3fdfdbefa83?w=100", original: "2 bell peppers, sliced"),
                    ExtendedIngredient(id: 4, name: "Cherry Tomatoes", amount: 1, unit: "cup", image: "https://images.unsplash.com/photo-1592924357228-91a4daadcfea?w=100", original: "1 cup cherry tomatoes")
                ],
                nutrition: Nutrition(calories: 320, carbs: 45, protein: 12, fat: 8, fiber: 6, sugar: 8, sodium: 420)
            ),
            Recipe(
                id: 7,
                title: "Quick & Easy Salmon Teriyaki",
                image: "https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=400",
                readyInMinutes: 18,
                servings: 2,
                pricePerServing: 5.20,
                healthScore: 90,
                diets: ["gluten free"],
                cuisines: ["Asian"],
                summary: "A quick and flavorful salmon dish with homemade teriyaki sauce. Perfect for a healthy weeknight dinner.",
                instructions: [
                    Instruction(id: 1, step: "Season salmon fillets with salt and pepper.", number: 1),
                    Instruction(id: 2, step: "Make the teriyaki sauce by combining ingredients.", number: 2),
                    Instruction(id: 3, step: "Cook salmon in a pan for 4-5 minutes per side.", number: 3),
                    Instruction(id: 4, step: "Brush with teriyaki sauce and serve with rice.", number: 4)
                ],
                extendedIngredients: [
                    ExtendedIngredient(id: 1, name: "Salmon Fillets", amount: 2, unit: "pieces", image: "https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=100", original: "2 salmon fillets"),
                    ExtendedIngredient(id: 2, name: "Soy Sauce", amount: 3, unit: "tbsp", image: "https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?w=100", original: "3 tbsp soy sauce"),
                    ExtendedIngredient(id: 3, name: "Honey", amount: 2, unit: "tbsp", image: "https://images.unsplash.com/photo-1558642084-fd07fae5282e?w=100", original: "2 tbsp honey"),
                    ExtendedIngredient(id: 4, name: "Ginger", amount: 1, unit: "tsp", image: "https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?w=100", original: "1 tsp fresh ginger, grated")
                ],
                nutrition: Nutrition(calories: 380, carbs: 12, protein: 42, fat: 18, fiber: 1, sugar: 10, sodium: 720)
            ),
            Recipe(
                id: 8,
                title: "Low-Calorie Zucchini Noodles",
                image: "https://images.unsplash.com/photo-1621996346565-e3dbc353d2e5?w=400",
                readyInMinutes: 15,
                servings: 2,
                pricePerServing: 2.20,
                healthScore: 95,
                diets: ["vegetarian", "gluten free", "low calorie"],
                cuisines: ["Italian"],
                summary: "Light and refreshing zucchini noodles with a light tomato sauce. Perfect for a low-calorie meal that's still satisfying.",
                instructions: [
                    Instruction(id: 1, step: "Spiralize zucchini into noodles.", number: 1),
                    Instruction(id: 2, step: "Sauté garlic and tomatoes in olive oil.", number: 2),
                    Instruction(id: 3, step: "Add zucchini noodles and cook for 2-3 minutes.", number: 3),
                    Instruction(id: 4, step: "Season with herbs and serve immediately.", number: 4)
                ],
                extendedIngredients: [
                    ExtendedIngredient(id: 1, name: "Zucchini", amount: 4, unit: "pieces", image: "https://images.unsplash.com/photo-1449300079323-02e209d9d3a6?w=100", original: "4 large zucchini"),
                    ExtendedIngredient(id: 2, name: "Cherry Tomatoes", amount: 1, unit: "cup", image: "https://images.unsplash.com/photo-1592924357228-91a4daadcfea?w=100", original: "1 cup cherry tomatoes"),
                    ExtendedIngredient(id: 3, name: "Garlic", amount: 3, unit: "cloves", image: "https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?w=100", original: "3 cloves garlic, minced"),
                    ExtendedIngredient(id: 4, name: "Basil", amount: 0.25, unit: "cup", image: "https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?w=100", original: "1/4 cup fresh basil")
                ],
                nutrition: Nutrition(calories: 120, carbs: 15, protein: 6, fat: 4, fiber: 4, sugar: 10, sodium: 180)
            ),
            Recipe(
                id: 9,
                title: "High-Protein Turkey Meatballs",
                image: "https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=400",
                readyInMinutes: 40,
                servings: 4,
                pricePerServing: 3.80,
                healthScore: 85,
                diets: ["gluten free"],
                cuisines: ["Italian"],
                summary: "Lean turkey meatballs packed with protein and flavor. Perfect for meal prep or a hearty dinner.",
                instructions: [
                    Instruction(id: 1, step: "Preheat oven to 400°F.", number: 1),
                    Instruction(id: 2, step: "Mix ground turkey with seasonings and breadcrumbs.", number: 2),
                    Instruction(id: 3, step: "Form into meatballs and place on baking sheet.", number: 3),
                    Instruction(id: 4, step: "Bake for 20-25 minutes until cooked through.", number: 4),
                    Instruction(id: 5, step: "Serve with marinara sauce and pasta.", number: 5)
                ],
                extendedIngredients: [
                    ExtendedIngredient(id: 1, name: "Ground Turkey", amount: 1.5, unit: "lbs", image: "https://images.unsplash.com/photo-1544025162-d76694265947?w=100", original: "1.5 lbs ground turkey"),
                    ExtendedIngredient(id: 2, name: "Egg", amount: 1, unit: "piece", image: "https://images.unsplash.com/photo-1518569656558-1ea25c4d4d3a?w=100", original: "1 egg"),
                    ExtendedIngredient(id: 3, name: "Breadcrumbs", amount: 0.5, unit: "cup", image: "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=100", original: "1/2 cup breadcrumbs"),
                    ExtendedIngredient(id: 4, name: "Parmesan Cheese", amount: 0.25, unit: "cup", image: "https://images.unsplash.com/photo-1488477181946-6428a0291777?w=100", original: "1/4 cup parmesan cheese")
                ],
                nutrition: Nutrition(calories: 220, carbs: 8, protein: 35, fat: 6, fiber: 1, sugar: 2, sodium: 480)
            ),
            Recipe(
                id: 10,
                title: "Vegan Chocolate Avocado Mousse",
                image: "https://images.unsplash.com/photo-1488477181946-6428a0291777?w=400",
                readyInMinutes: 20,
                servings: 4,
                pricePerServing: 2.10,
                healthScore: 75,
                diets: ["vegan", "gluten free"],
                cuisines: ["International"],
                summary: "A rich and creamy chocolate mousse made with avocado. Surprisingly healthy and absolutely delicious.",
                instructions: [
                    Instruction(id: 1, step: "Blend avocado with cocoa powder and sweetener.", number: 1),
                    Instruction(id: 2, step: "Add vanilla and blend until smooth.", number: 2),
                    Instruction(id: 3, step: "Chill in refrigerator for at least 1 hour.", number: 3),
                    Instruction(id: 4, step: "Serve with fresh berries and enjoy.", number: 4)
                ],
                extendedIngredients: [
                    ExtendedIngredient(id: 1, name: "Avocado", amount: 2, unit: "pieces", image: "https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?w=100", original: "2 ripe avocados"),
                    ExtendedIngredient(id: 2, name: "Cocoa Powder", amount: 0.25, unit: "cup", image: "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=100", original: "1/4 cup cocoa powder"),
                    ExtendedIngredient(id: 3, name: "Maple Syrup", amount: 3, unit: "tbsp", image: "https://images.unsplash.com/photo-1558642084-fd07fae5282e?w=100", original: "3 tbsp maple syrup"),
                    ExtendedIngredient(id: 4, name: "Vanilla Extract", amount: 1, unit: "tsp", image: "https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?w=100", original: "1 tsp vanilla extract")
                ],
                nutrition: Nutrition(calories: 180, carbs: 22, protein: 4, fat: 12, fiber: 8, sugar: 16, sodium: 10)
            )
        ]
    }
    
    var filteredRecipes: [Recipe] {
        var filtered = recipes
        
        // Filter by category
        if let category = selectedCategory {
            filtered = filtered.filter { recipe in
                recipe.diets.contains { diet in
                    diet.lowercased() == category.rawValue.lowercased() ||
                    diet.lowercased().contains(category.rawValue.lowercased())
                }
            }
        }
        
        // Filter by search text
        if !searchText.isEmpty {
            filtered = filtered.filter { recipe in
                recipe.title.localizedCaseInsensitiveContains(searchText) ||
                recipe.summary.localizedCaseInsensitiveContains(searchText) ||
                recipe.cuisines.contains { cuisine in
                    cuisine.localizedCaseInsensitiveContains(searchText)
                }
            }
        }
        
        return filtered
    }
}
