//
//  ForgotPasswordView.swift
//  Food App New
//
//  Created by Danciu David on 16.10.2025.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var email = ""
    @State private var isLoading = false
    
    var body: some View {
        NavigationView {
            ZStack {
                TwoToneBackground(splitPercentage: 0.42)
                
                VStack(spacing: 0) {
                    // Header - positioned in colored section
                    VStack(spacing: Spacing.lg) {
                        Image(systemName: "lock.rotation")
                            .font(.system(size: 60, weight: .light))
                            .foregroundColor(.white)

                        VStack(spacing: Spacing.sm) {
                            Text("Reset Password")
                                .font(.title1)
                                .foregroundColor(.white)
                                .fontWeight(.bold)

                            Text("Enter your email address and we'll send you a link to reset your password")
                                .font(.callout)
                                .foregroundColor(.white.opacity(0.9))
                                .multilineTextAlignment(.center)
                        }
                    }
                    .padding(.top, Spacing.xxxl)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    // Form Section
                    VStack(spacing: Spacing.xl) {
                        CustomTextField(placeholder: "Email", text: $email)
                        
                        PrimaryButton(title: "Send Reset Link", action: {
                            // Handle password reset
                        }, isLoading: isLoading)
                        
                        Spacer()
                    }
                    .padding(.top, Spacing.xxxl)
                    .padding(.horizontal, Spacing.screenHorizontal)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.background)
                }
            }
            .navigationBarHidden(false)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.callout)
                    .foregroundColor(.textSecondary)
                }
            }
        }
    }
}

#Preview {
    ForgotPasswordView()
}
