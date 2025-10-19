//
//  RecipesView.swift
//  Food App New
//
//  Created by Danciu David on 16.10.2025.
//

import SwiftUI

struct RecipesView: View {
    @StateObject private var dataManager = RecipeDataManager()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Header
                    headerView
                    
                    // Search Bar
                    searchBarView
                    
                    // Category Pills
                    categoryPillsView
                    
                    // Recipes Grid
                    recipesGridView
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    // MARK: - Header View
    private var headerView: some View {
        HStack {
            Text("Recipes")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.textDark)
            
            Spacer()
        }
        .padding(.horizontal, Spacing.screenHorizontal)
        .padding(.top, Spacing.md)
        .padding(.bottom, Spacing.lg)
    }
    
    // MARK: - Search Bar View
    private var searchBarView: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.textSecondary)
                .padding(.leading, Spacing.md)
            
            TextField("Search recipes...", text: $dataManager.searchText)
                .font(.bodyText)
                .foregroundColor(.textDark)
                .textFieldStyle(PlainTextFieldStyle())
            
            if !dataManager.searchText.isEmpty {
                Button(action: {
                    dataManager.searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.textSecondary)
                }
                .padding(.trailing, Spacing.md)
            }
        }
        .padding(.vertical, Spacing.md)
        .padding(.horizontal, Spacing.md)
        .background(Color.lightGreen)
        .cornerRadius(Spacing.md)
        .padding(.horizontal, Spacing.screenHorizontal)
        .padding(.bottom, Spacing.lg)
    }
    
    // MARK: - Category Pills View
    private var categoryPillsView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: Spacing.sm) {
                // All Categories Button
                Button(action: {
                    dataManager.selectedCategory = nil
                }) {
                    HStack(spacing: Spacing.xs) {
                        Image(systemName: "list.bullet")
                            .font(.caption)
                        
                        Text("All")
                            .font(.subheadline)
                            .fontWeight(.medium)
                    }
                    .foregroundColor(dataManager.selectedCategory == nil ? .white : .textDark)
                    .padding(.horizontal, Spacing.md)
                    .padding(.vertical, Spacing.sm)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(dataManager.selectedCategory == nil ? Color.primary : Color.lightGreen)
                    )
                }
                .buttonStyle(PlainButtonStyle())
                .animation(.easeInOut(duration: 0.2), value: dataManager.selectedCategory == nil)
                
                ForEach(RecipeCategory.allCases, id: \.self) { category in
                    CategoryChip(
                        category: category,
                        isSelected: dataManager.selectedCategory == category,
                        onTap: {
                            dataManager.selectedCategory = dataManager.selectedCategory == category ? nil : category
                        }
                    )
                }
            }
            .padding(.horizontal, Spacing.screenHorizontal)
        }
        .padding(.bottom, Spacing.lg)
    }
    
    // MARK: - Recipes Grid View
    private var recipesGridView: some View {
        ScrollView {
            LazyVGrid(
                columns: [
                    GridItem(.flexible(), spacing: 12),
                    GridItem(.flexible(), spacing: 12)
                ],
                spacing: 12
            ) {
                ForEach(dataManager.filteredRecipes) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                        RecipeCardContent(recipe: recipe)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    RecipesView()
}
