//
//  RecipeCard.swift
//  Food App New
//
//  Created by Danciu David on 16.10.2025.
//

import SwiftUI

struct RecipeCard: View {
    let recipe: Recipe
    let onTap: () -> Void
    @State private var isPressed = false
    
    var body: some View {
        Button(action: onTap) {
            RecipeCardContent(recipe: recipe)
                .scaleEffect(isPressed ? 0.98 : 1.0)
        }
        .buttonStyle(PlainButtonStyle())
        .onLongPressGesture(minimumDuration: 0, maximumDistance: .infinity, pressing: { pressing in
            withAnimation(.easeInOut(duration: 0.1)) {
                isPressed = pressing
            }
        }, perform: {})
    }
}

struct RecipeCardContent: View {
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Image - Fixed height
            AsyncImage(url: URL(string: recipe.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .fill(Color.lightGreen.opacity(0.3))
                    .overlay(
                        Image(systemName: "photo")
                            .font(.title2)
                            .foregroundColor(.textSecondary)
                    )
            }
            .frame(height: 120)
            .clipped()
            
            // Content
            VStack(alignment: .leading, spacing: 8) {
                // Title
                Text(recipe.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.textDark)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // Cook time
                HStack {
                    Image(systemName: "clock")
                        .font(.caption)
                        .foregroundColor(.textSecondary)
                    
                    Text("\(recipe.readyInMinutes) min")
                        .font(.caption)
                        .foregroundColor(.textSecondary)
                    
                    Spacer()
                }
            }
            .padding(12)
        }
        .background(Color.background)
        .cornerRadius(12)
        .shadow(color: .shadow, radius: 4, x: 0, y: 2)
        .frame(height: 200) // FIXED HEIGHT
    }
}

struct RecipeNutritionBadge: View {
    let icon: String
    let value: String
    let unit: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: icon)
                .font(.caption2)
                .foregroundColor(.white)
            
            Text("\(value)\(unit)")
                .font(.caption2)
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
        .padding(.horizontal, Spacing.sm)
        .padding(.vertical, 4)
        .background(color)
        .cornerRadius(8)
    }
}

#Preview {
    let sampleRecipe = Recipe(
        id: 1,
        title: "Healthy Taco Salad",
        image: "https://images.unsplash.com/photo-1512058564366-18510be2db19?w=400",
        readyInMinutes: 15,
        servings: 4,
        pricePerServing: 2.50,
        healthScore: 85,
        diets: ["vegetarian", "gluten free"],
        cuisines: ["Mexican"],
        summary: "This Healthy Taco Salad is the universal delight of taco night.",
        instructions: [],
        extendedIngredients: [],
        nutrition: Nutrition(calories: 320, carbs: 18, protein: 28, fat: 16, fiber: 8, sugar: 6, sodium: 420)
    )
    
    RecipeCard(recipe: sampleRecipe) {
        print("Tapped recipe")
    }
    .padding()
}
