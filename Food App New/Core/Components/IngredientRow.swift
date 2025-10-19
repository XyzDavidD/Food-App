//
//  IngredientRow.swift
//  Food App New
//
//  Created by Danciu David on 16.10.2025.
//

import SwiftUI

struct IngredientRow: View {
    let ingredient: ExtendedIngredient
    
    var body: some View {
        HStack(spacing: Spacing.md) {
            // Ingredient Image
            AsyncImage(url: URL(string: ingredient.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Circle()
                    .fill(Color.lightGreen.opacity(0.3))
                    .overlay(
                        Image(systemName: "photo")
                            .font(.caption)
                            .foregroundColor(.textSecondary)
                    )
            }
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            
            // Ingredient Info
            VStack(alignment: .leading, spacing: 2) {
                Text(ingredient.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.textDark)
                
                Text(ingredient.original)
                    .font(.caption)
                    .foregroundColor(.textSecondary)
            }
            
            Spacer()
        }
        .padding(.vertical, Spacing.sm)
    }
}

#Preview {
    let sampleIngredient = ExtendedIngredient(
        id: 1,
        name: "Ground Turkey",
        amount: 1,
        unit: "lb",
        image: "https://images.unsplash.com/photo-1544025162-d76694265947?w=100",
        original: "1 lb ground turkey"
    )
    
    IngredientRow(ingredient: sampleIngredient)
        .padding()
}
