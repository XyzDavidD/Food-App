//
//  MainTabView.swift
//  Food App New
//
//  Created by Danciu David on 16.10.2025.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    private let tabs = [
        TabItem(tag: 0, icon: "house.fill", title: "Home", isCenter: false),
        TabItem(tag: 1, icon: "camera.fill", title: "Scan", isCenter: false),
        TabItem(tag: 2, icon: "message.fill", title: "AI Chat", isCenter: true),
        TabItem(tag: 3, icon: "book.fill", title: "Recipes", isCenter: false),
        TabItem(tag: 4, icon: "person.fill", title: "Profile", isCenter: false)
    ]
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack {
                // Main Content
                Group {
                    switch selectedTab {
                    case 0:
                        HomeView()
                    case 1:
                        ScanView()
                    case 2:
                        ScanView() // AI Chat - placeholder for now
                    case 3:
                        RecipesView()
                    case 4:
                        ProfileView()
                    default:
                        HomeView()
                    }
                }
                
                Spacer()
                
                // Custom Tab Bar
                CustomTabBar(selectedTab: $selectedTab)
                    .padding(.bottom, -10) // Move it even closer to the bottom
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct TabItem {
    let tag: Int
    let icon: String
    let title: String
    let isCenter: Bool
}

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    private let tabs = [
        TabItem(tag: 0, icon: "house.fill", title: "Home", isCenter: false),
        TabItem(tag: 1, icon: "camera.fill", title: "Scan", isCenter: false),
        TabItem(tag: 2, icon: "message.fill", title: "AI Chat", isCenter: true),
        TabItem(tag: 3, icon: "book.fill", title: "Recipes", isCenter: false),
        TabItem(tag: 4, icon: "person.fill", title: "Profile", isCenter: false)
    ]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(tabs, id: \.tag) { tab in
                Button(action: {
                    selectedTab = tab.tag
                }) {
                    VStack(spacing: 4) {
                        if tab.isCenter {
                            Image(systemName: "fork.knife")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundColor(.white)
                                .frame(width: 50, height: 50)
                                .background(
                                    Circle()
                                        .fill(Color.primary)
                                )
                        } else {
                            Image(systemName: tab.icon)
                                .font(.system(size: 20, weight: .medium))
                                .foregroundColor(selectedTab == tab.tag ? .primary : .textSecondary)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .frame(height: 60)
        .background(Color.background)
    }
}

#Preview {
    MainTabView()
}
