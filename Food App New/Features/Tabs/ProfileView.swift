//
//  ProfileView.swift
//  Food App New
//
//  Created by Danciu David on 16.10.2025.
//

import SwiftUI

struct ProfileView: View {
    @State private var showLogoutAlert = false
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: Spacing.xxxl) {
                    // Header Section
                    VStack(spacing: Spacing.lg) {
                        // Profile Avatar
                        ZStack {
                            Circle()
                                .fill(Color.lightGreen)
                                .frame(width: 100, height: 100)

                            Image(systemName: "person.fill")
                                .font(.system(size: 40, weight: .light))
                                .foregroundColor(.primary)
                        }

                        // User Name
                        VStack(spacing: Spacing.sm) {
                            Text("John Doe")
                                .font(.title1)
                                .foregroundColor(.textDark)
                                .fontWeight(.bold)

                            Text("john.doe@example.com")
                                .font(.callout)
                                .foregroundColor(.textSecondary)
                        }
                    }
                    .padding(.top, Spacing.xxxl)

                    // Action Buttons
                    VStack(spacing: Spacing.lg) {
                        // Upgrade Plan Button
                        Button(action: {
                            // Handle upgrade plan
                        }) {
                            HStack {
                                Image(systemName: "crown.fill")
                                    .font(.system(size: 18, weight: .medium))
                                    .foregroundColor(.primary)

                                Text("Upgrade Plan")
                                    .font(.headline)
                                    .foregroundColor(.textDark)

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.textSecondary)
                            }
                            .padding(.horizontal, Spacing.xl)
                            .padding(.vertical, Spacing.lg)
                            .background(
                                RoundedRectangle(cornerRadius: Spacing.buttonCornerRadius)
                                    .fill(Color.background)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: Spacing.buttonCornerRadius)
                                            .stroke(Color.border, lineWidth: 1)
                                    )
                            )
                        }

                        // Settings Buttons
                        VStack(spacing: Spacing.md) {
                            ProfileButton(
                                icon: "doc.text",
                                title: "Privacy Policy",
                                action: {
                                    // Handle privacy policy
                                }
                            )

                            ProfileButton(
                                icon: "doc.plaintext",
                                title: "Terms of Service",
                                action: {
                                    // Handle terms of service
                                }
                            )

                            ProfileButton(
                                icon: "rectangle.portrait.and.arrow.right",
                                title: "Log Out",
                                action: {
                                    showLogoutAlert = true
                                },
                                isDestructive: true
                            )
                        }
                    }
                    .padding(.horizontal, Spacing.screenHorizontal)

                    Spacer(minLength: Spacing.xxxl)
                }
            }
        }
        .navigationBarHidden(true)
        .alert("Log Out", isPresented: $showLogoutAlert) {
            Button("Cancel", role: .cancel) { }
            Button("Log Out", role: .destructive) {
                // Handle logout
            }
        } message: {
            Text("Are you sure you want to log out?")
        }
    }
}

struct ProfileButton: View {
    let icon: String
    let title: String
    let action: () -> Void
    var isDestructive: Bool = false
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(isDestructive ? .red : .textSecondary)
                    .frame(width: 24)

                Text(title)
                    .font(.callout)
                    .foregroundColor(isDestructive ? .red : .textDark)

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.textSecondary)
            }
            .padding(.horizontal, Spacing.xl)
            .padding(.vertical, Spacing.lg)
            .background(
                RoundedRectangle(cornerRadius: Spacing.buttonCornerRadius)
                    .fill(Color.background)
                    .overlay(
                        RoundedRectangle(cornerRadius: Spacing.buttonCornerRadius)
                            .stroke(Color.border, lineWidth: 1)
                    )
            )
        }
    }
}

#Preview {
    ProfileView()
}
