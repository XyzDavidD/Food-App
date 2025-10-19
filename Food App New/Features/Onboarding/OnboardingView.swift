//
//  OnboardingView.swift
//  Food App New
//
//  Created by Danciu David on 16.10.2025.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    @State private var showMainApp = false
    @State private var showAuthentication = false
    
    private let pages = [
        OnboardingPage(
            title: "Track Your Nutrition",
            subtitle: "Scan any food and get instant nutritional insights with our AI-powered technology.",
            imageName: "camera.fill"
        ),
        OnboardingPage(
            title: "Smart Analytics",
            subtitle: "Get detailed analytics about your eating habits and personalized recommendations.",
            imageName: "chart.bar.fill"
        ),
        OnboardingPage(
            title: "Achieve Your Goals",
            subtitle: "Set and track your nutrition goals with our comprehensive tracking system.",
            imageName: "target"
        )
    ]
    
    var body: some View {
        if showMainApp {
            MainTabView()
        } else if showAuthentication {
            AuthenticationView(showMainApp: $showMainApp)
        } else {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Skip Button
                    HStack {
                        Spacer()
                        Button("Skip") {
                            showAuthentication = true
                        }
                        .font(.callout)
                        .foregroundColor(.textSecondary)
                        .padding(.horizontal, Spacing.screenHorizontal)
                        .padding(.top, Spacing.lg)
                    }
                    
                    // Onboarding Content
                    TabView(selection: $currentPage) {
                        ForEach(0..<pages.count, id: \.self) { index in
                            OnboardingPageView(page: pages[index])
                                .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .animation(.easeInOut, value: currentPage)
                    
                    // Bottom Section
                    VStack(spacing: Spacing.xl) {
                        // Progress Indicator
                        HStack(spacing: Spacing.sm) {
                            ForEach(0..<pages.count, id: \.self) { index in
                                Circle()
                                    .fill(index == currentPage ? Color.primary : Color.gray.opacity(0.3))
                                    .frame(width: 8, height: 8)
                                    .animation(.easeInOut, value: currentPage)
                            }
                        }
                        
                        // Action Buttons
                        HStack(spacing: Spacing.lg) {
                            // Back Button (only show if not on first page)
                            if currentPage > 0 {
                                Button(action: {
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                                        currentPage -= 1
                                    }
                                }) {
                                    HStack(spacing: Spacing.sm) {
                                        Image(systemName: "arrow.left")
                                            .font(.system(size: 16, weight: .semibold))
                                            .foregroundColor(.primary)
                                        
                                        Text("Back")
                                            .font(.buttonText)
                                            .foregroundColor(.primary)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(.horizontal, Spacing.xl)
                                    .padding(.vertical, Spacing.lg)
                                    .background(
                                        RoundedRectangle(cornerRadius: Spacing.buttonCornerRadius)
                                            .stroke(Color.primary, lineWidth: 2)
                                    )
                                }
                                .scaleEffect(1.0)
                                .animation(.spring(response: 0.3, dampingFraction: 0.7), value: currentPage)
                            }
                            
                            if currentPage < pages.count - 1 {
                                Button(action: {
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                                        currentPage += 1
                                    }
                                }) {
                                    HStack(spacing: Spacing.sm) {
                                        Text("Next")
                                            .font(.buttonText)
                                            .foregroundColor(.white)
                                        
                                        Image(systemName: "arrow.right")
                                            .font(.system(size: 16, weight: .semibold))
                                            .foregroundColor(.white)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(.horizontal, Spacing.xl)
                                    .padding(.vertical, Spacing.lg)
                                    .background(
                                        RoundedRectangle(cornerRadius: Spacing.buttonCornerRadius)
                                            .fill(Color.primary)
                                            .shadow(color: Color.primary.opacity(0.3), radius: 8, x: 0, y: 4)
                                    )
                                }
                                .scaleEffect(1.0)
                                .animation(.spring(response: 0.3, dampingFraction: 0.7), value: currentPage)
                            } else {
                                Button(action: {
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                                        showAuthentication = true
                                    }
                                }) {
                                    Text("Get Started")
                                        .font(.buttonText)
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .padding(.horizontal, Spacing.xl)
                                        .padding(.vertical, Spacing.lg)
                                        .background(
                                            RoundedRectangle(cornerRadius: Spacing.buttonCornerRadius)
                                                .fill(Color.primary)
                                                .shadow(color: Color.primary.opacity(0.3), radius: 8, x: 0, y: 4)
                                        )
                                }
                                .scaleEffect(1.0)
                                .animation(.spring(response: 0.3, dampingFraction: 0.7), value: currentPage)
                            }
                        }
                        .padding(.horizontal, Spacing.screenHorizontal)
                    }
                    .padding(.bottom, Spacing.xxxl)
                }
            }
        }
    }
}

struct OnboardingPage {
    let title: String
    let subtitle: String
    let imageName: String
}

struct OnboardingPageView: View {
    let page: OnboardingPage
    
    var body: some View {
        VStack(spacing: Spacing.xxxl) {
            Spacer()
            
            // Image Placeholder
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.primary.opacity(0.1), Color.primary.opacity(0.3)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 200, height: 200)
                
                Image(systemName: page.imageName)
                    .font(.system(size: 60, weight: .light))
                    .foregroundColor(.primary)
            }
            
            // Text Content
            VStack(spacing: Spacing.lg) {
                Text(page.title)
                    .font(.largeTitle)
                    .foregroundColor(.textDark)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text(page.subtitle)
                    .font(.bodyText)
                    .foregroundColor(.textSecondary)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
            }
            .padding(.horizontal, Spacing.screenHorizontal)
            
            Spacer()
        }
    }
}

#Preview {
    OnboardingView()
}
