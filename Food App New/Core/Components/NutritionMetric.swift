//
//  NutritionMetric.swift
//  Food App New
//
//  Created by Danciu David on 16.10.2025.
//

import SwiftUI

struct NutritionMetric: View {
    let icon: String
    let value: String
    let unit: String
    let color: Color
    
    var body: some View {
        VStack(spacing: Spacing.xs) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(color)
            
            Text(value)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.textDark)
            
            Text(unit)
                .font(.caption)
                .foregroundColor(.textSecondary)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    HStack(spacing: Spacing.lg) {
        NutritionMetric(
            icon: "leaf.fill",
            value: "65g",
            unit: "carbs",
            color: .green
        )
        
        NutritionMetric(
            icon: "dumbbell.fill",
            value: "27g",
            unit: "proteins",
            color: .blue
        )
        
        NutritionMetric(
            icon: "flame.fill",
            value: "120",
            unit: "Kcal",
            color: .orange
        )
        
        NutritionMetric(
            icon: "drop.fill",
            value: "91g",
            unit: "fats",
            color: .purple
        )
    }
    .padding()
}
