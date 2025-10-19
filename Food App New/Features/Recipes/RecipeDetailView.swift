import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 0) {
                    // Hero Image with Back Button Overlay
                    ZStack(alignment: .topLeading) {
                        AsyncImage(url: URL(string: recipe.image)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Rectangle()
                                .fill(Color.lightGreen.opacity(0.3))
                        }
                        .frame(height: 300)
                        .clipped()
                        .ignoresSafeArea(.all, edges: .top)
                        
                        // Back Button Overlay
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "arrow.left")
                                .font(.title2)
                                .foregroundColor(.white)
                                .frame(width: 40, height: 40)
                                .background(.ultraThinMaterial, in: Circle())
                        }
                        .padding(.leading, 50) // Even more left spacing
                        .padding(.trailing, 20)
                        .padding(.top, 50)
                    }
                    
                    // Content Container - Centered with 80% width
                    VStack(spacing: 20) {
                        // Title
                        Text(recipe.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.textDark)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        // Description
                        Text(recipe.summary.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression))
                            .font(.body)
                            .foregroundColor(.textSecondary)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        // Time and Servings
                        HStack {
                            HStack {
                                Image(systemName: "clock")
                                    .foregroundColor(.textSecondary)
                                Text("\(recipe.readyInMinutes) min")
                                    .foregroundColor(.textSecondary)
                            }
                            
                            Spacer()
                            
                            HStack {
                                Image(systemName: "person.2")
                                    .foregroundColor(.textSecondary)
                                Text("\(recipe.servings) servings")
                                    .foregroundColor(.textSecondary)
                            }
                        }
                        
                        // Nutrition
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Nutrition")
                                .font(.headline)
                                .fontWeight(.semibold)
                            
                            LazyVGrid(columns: [
                                GridItem(.flexible()),
                                GridItem(.flexible())
                            ], spacing: 12) {
                                NutritionCard(icon: "flame.fill", value: "\(Int(recipe.nutrition.calories))", unit: "cal", color: .orange)
                                NutritionCard(icon: "dumbbell.fill", value: "\(Int(recipe.nutrition.protein))", unit: "g", color: .blue)
                                NutritionCard(icon: "leaf.fill", value: "\(Int(recipe.nutrition.carbs))", unit: "g", color: .green)
                                NutritionCard(icon: "drop.fill", value: "\(Int(recipe.nutrition.fat))", unit: "g", color: .purple)
                            }
                        }
                        
                        // Ingredients
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Ingredients")
                                .font(.headline)
                                .fontWeight(.semibold)
                            
                            ForEach(recipe.extendedIngredients) { ingredient in
                                HStack {
                                    AsyncImage(url: URL(string: ingredient.image)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                    } placeholder: {
                                        Circle()
                                            .fill(Color.lightGreen.opacity(0.3))
                                    }
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                    
                                    VStack(alignment: .leading) {
                                        Text(ingredient.name)
                                            .font(.subheadline)
                                            .fontWeight(.medium)
                                        Text(ingredient.original)
                                            .font(.caption)
                                            .foregroundColor(.textSecondary)
                                    }
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 8)
                            }
                        }
                        
                        // Instructions
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Instructions")
                                .font(.headline)
                                .fontWeight(.semibold)
                            
                            ForEach(recipe.instructions) { instruction in
                                HStack(alignment: .top) {
                                    Text("\(instruction.number)")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(width: 30, height: 30)
                                        .background(Color.primary, in: Circle())
                                    
                                    Text(instruction.step)
                                        .font(.body)
                                        .foregroundColor(.textDark)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 8)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 40) // Much more spacing for 80% width
                    .padding(.top, 20)
                    .padding(.bottom, 100)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct NutritionCard: View {
    let icon: String
    let value: String
    let unit: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)
            
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.textDark)
            
            Text(unit)
                .font(.caption)
                .foregroundColor(.textSecondary)
        }
        .frame(height: 80)
        .frame(maxWidth: .infinity)
        .background(Color.lightGreen.opacity(0.1))
        .cornerRadius(12)
    }
}

#Preview {
    RecipeDetailView(recipe: RecipeDataManager().recipes[0])
}