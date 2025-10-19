//
//  HomeView.swift
//  Food App New
//
//  Created by Danciu David on 16.10.2025.
//

import SwiftUI
import Charts

struct HomeView: View {
    @State private var showingMealDetail = false
    @State private var selectedMeal: Meal? = nil
    @State private var selectedDate = Date()
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: Spacing.xl) {
                    // Quick Stats Cards
                    quickStatsSection
                    
                    // Recent Meals
                    recentMealsSection
                }
                .padding(.horizontal, Spacing.screenHorizontal)
                .padding(.bottom, 100) // Space for tab bar
            }
        }
        .navigationBarHidden(true)
        .sheet(isPresented: $showingMealDetail) {
            if let meal = selectedMeal {
                MealDetailView(meal: meal)
            }
        }
    }
    
    
    // MARK: - Quick Stats Section
    private var quickStatsSection: some View {
        VStack(alignment: .leading, spacing: Spacing.md) {
            HStack {
                Text("Nutrition Overview")
                    .font(.headline)
                    .foregroundColor(.textDark)
                    .fontWeight(.semibold)
                
                Spacer()
                
                DatePicker("", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(CompactDatePickerStyle())
                    .labelsHidden()
            }
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: Spacing.md) {
                StatCard(
                    title: "Calories",
                    value: "1,847",
                    unit: "kcal",
                    icon: "flame.fill",
                    color: .orange
                )

                StatCard(
                    title: "Protein",
                    value: "89",
                    unit: "g",
                    icon: "dumbbell.fill",
                    color: .blue
                )

                StatCard(
                    title: "Carbs",
                    value: "156",
                    unit: "g",
                    icon: "leaf.fill",
                    color: .green
                )

                StatCard(
                    title: "Fat",
                    value: "67",
                    unit: "g",
                    icon: "drop.fill",
                    color: .purple
                )
            }
        }
    }
    
    
    // MARK: - Recent Meals Section
    private var recentMealsSection: some View {
        VStack(alignment: .leading, spacing: Spacing.md) {
            HStack {
                Text("Recent Meals")
                    .font(.headline)
                    .foregroundColor(.textDark)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button("View All") {
                    // Handle view all
                }
                .font(.callout)
                .foregroundColor(.primary)
            }
            
            LazyVStack(spacing: Spacing.md) {
                ForEach(sampleMeals) { meal in
                    MealCard(meal: meal) {
                        selectedMeal = meal
                        showingMealDetail = true
                    }
                }
            }
        }
    }
}

// MARK: - Supporting Views

struct StatCard: View {
    let title: String
    let value: String
    let unit: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.white)
                
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: Spacing.xs) {
                HStack(alignment: .bottom, spacing: 2) {
                    Text(value)
                        .font(.title2)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    Text(unit)
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.8))
                }
                
                Text(title)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.8))
            }
        }
        .padding(Spacing.lg)
        .background(
            RoundedRectangle(cornerRadius: Spacing.buttonCornerRadius)
                .fill(color)
                .shadow(color: color.opacity(0.3), radius: 8, x: 0, y: 4)
        )
    }
}

struct MealCard: View {
    let meal: Meal
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: Spacing.md) {
                // Meal Info
                VStack(alignment: .leading, spacing: Spacing.xs) {
                    Text(meal.name)
                        .font(.headline)
                        .foregroundColor(.textDark)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                    
                    Text(meal.time)
                        .font(.caption)
                        .foregroundColor(.textSecondary)
                    
                    HStack(spacing: Spacing.sm) {
                        NutritionBadge(value: meal.calories, unit: "kcal", color: .orange)
                        NutritionBadge(value: meal.protein, unit: "g", color: .blue)
                        NutritionBadge(value: meal.carbs, unit: "g", color: .green)
                    }
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.textSecondary)
            }
            .padding(Spacing.lg)
            .background(
                RoundedRectangle(cornerRadius: Spacing.buttonCornerRadius)
                    .fill(Color.gray.opacity(0.05))
                    .shadow(color: Color.shadow.opacity(0.1), radius: 4, x: 0, y: 2)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct NutritionBadge: View {
    let value: String
    let unit: String
    let color: Color
    
    var body: some View {
        Text(value)
            .font(.caption)
            .foregroundColor(color)
            .fontWeight(.semibold)
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(color.opacity(0.1))
            )
    }
}


struct MealDetailView: View {
    let meal: Meal
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: Spacing.xl) {
                    // Meal Header
                    VStack(spacing: Spacing.lg) {
                        ZStack {
                            Circle()
                                .fill(Color.lightGreen)
                                .frame(width: 100, height: 100)

                            Image(systemName: meal.icon)
                                .font(.system(size: 40, weight: .medium))
                                .foregroundColor(.primary)
                        }

                        VStack(spacing: Spacing.sm) {
                            Text(meal.name)
                                .font(.title1)
                                .foregroundColor(.textDark)
                                .fontWeight(.bold)

                            Text(meal.time)
                                .font(.callout)
                                .foregroundColor(.textSecondary)
                        }
                    }
                    .padding(.top, Spacing.xl)

                    // Nutrition Details
                    VStack(alignment: .leading, spacing: Spacing.md) {
                        Text("Nutrition Facts")
                            .font(.headline)
                            .foregroundColor(.textDark)
                            .fontWeight(.semibold)

                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: Spacing.md) {
                            NutritionDetailCard(title: "Calories", value: meal.calories, unit: "kcal", color: .orange)
                            NutritionDetailCard(title: "Protein", value: meal.protein, unit: "g", color: .blue)
                            NutritionDetailCard(title: "Carbs", value: meal.carbs, unit: "g", color: .green)
                            NutritionDetailCard(title: "Fat", value: meal.fat, unit: "g", color: .purple)
                        }
                    }
                }
                .padding(.horizontal, Spacing.screenHorizontal)
            }
            .navigationTitle("Meal Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct NutritionDetailCard: View {
    let title: String
    let value: String
    let unit: String
    let color: Color

    var body: some View {
        VStack(spacing: Spacing.sm) {
            Text(title)
                .font(.caption)
                .foregroundColor(.textSecondary)

            HStack(alignment: .bottom, spacing: 2) {
                Text(value)
                    .font(.title2)
                    .foregroundColor(color)
                    .fontWeight(.bold)

                Text(unit)
                    .font(.caption)
                    .foregroundColor(.textSecondary)
            }
        }
        .padding(Spacing.lg)
        .background(
            RoundedRectangle(cornerRadius: Spacing.buttonCornerRadius)
                .fill(color.opacity(0.1))
        )
    }
}

// MARK: - Data Models

struct Meal: Identifiable {
    let id = UUID()
    let name: String
    let time: String
    let icon: String
    let calories: String
    let protein: String
    let carbs: String
    let fat: String
}

// MARK: - Sample Data

let sampleMeals = [
    Meal(name: "Grilled Chicken Salad", time: "2:30 PM", icon: "leaf.fill", calories: "320", protein: "28g", carbs: "12g", fat: "18g"),
    Meal(name: "Greek Yogurt Bowl", time: "10:15 AM", icon: "bowl.fill", calories: "180", protein: "15g", carbs: "22g", fat: "4g"),
    Meal(name: "Avocado Toast", time: "8:00 AM", icon: "toast.fill", calories: "280", protein: "8g", carbs: "32g", fat: "14g"),
    Meal(name: "Salmon & Quinoa", time: "7:45 PM", icon: "fish.fill", calories: "450", protein: "35g", carbs: "38g", fat: "18g")
]

#Preview {
    HomeView()
}
