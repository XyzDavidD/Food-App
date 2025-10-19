//
//  AuthenticationView.swift
//  Food App New
//
//  Created by Danciu David on 16.10.2025.
//

import SwiftUI
import AuthenticationServices

struct AuthenticationView: View {
    @State private var isLoginMode = true
    @Binding var showMainApp: Bool
    @State private var showForgotPassword = false
    
    var body: some View {
        NavigationView {
            ZStack {
                TwoToneBackground(splitPercentage: 0.42) // Use the custom background

                VStack(spacing: 0) { // Use VStack for fixed layout
                    // Top Colored Section Content
                    VStack(spacing: Spacing.lg) {
                        Spacer()
                        
                        Image(systemName: "fork.knife")
                            .font(.system(size: 50, weight: .light))
                            .foregroundColor(.white)

                        VStack(spacing: Spacing.sm) {
                            Text("Welcome to")
                                .font(.title3)
                                .foregroundColor(.white.opacity(0.9))

                            Text("FoodTracker")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity) // Take up available space in top section

                    // Bottom White Section Content (Form)
                    VStack(spacing: Spacing.xl) {
                        if isLoginMode {
                            LoginFormView(
                                isLoginMode: $isLoginMode,
                                showMainApp: $showMainApp,
                                showForgotPassword: $showForgotPassword
                            )
                        } else {
                            SignupFormView(
                                isLoginMode: $isLoginMode,
                                showMainApp: $showMainApp
                            )
                        }
                    }
                    .padding(.top, Spacing.xxxl) // Padding to push content down from the split line
                    .padding(.horizontal, Spacing.screenHorizontal)
                    .frame(maxWidth: .infinity, maxHeight: .infinity) // Take up available space in bottom section
                    .background(Color.background) // Ensure white background for this section
                }
            }
            .navigationBarHidden(true)
            .fullScreenCover(isPresented: $showForgotPassword) {
                ForgotPasswordView()
            }
        }
    }
}

struct LoginFormView: View {
    @Binding var isLoginMode: Bool
    @Binding var showMainApp: Bool
    @Binding var showForgotPassword: Bool
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: Spacing.xl) {
            // Title
            VStack(spacing: Spacing.sm) {
                Text("Sign In")
                    .font(.title1)
                    .foregroundColor(.textDark)
                    .fontWeight(.bold)
                
                Text("Welcome back! Please sign in to your account")
                    .font(.callout)
                    .foregroundColor(.textSecondary)
                    .multilineTextAlignment(.center)
            }
            .padding(.bottom, Spacing.lg)
            
            // Form Fields
            VStack(spacing: Spacing.lg) {
                CustomTextField(placeholder: "Email", text: $email)
                CustomTextField(placeholder: "Password", text: $password, isSecure: true)
            }
            
            // Forgot Password
            HStack {
                Spacer()
                Button("Forgot Password?") {
                    showForgotPassword = true
                }
                .font(.callout)
                .foregroundColor(.primary)
            }
            
            // Login Button
            PrimaryButton(title: "Sign In") {
                showMainApp = true
            }
            
            // Apple Sign In
            SignInWithAppleButton(
                .signIn, // Dynamically change button type
                onRequest: { request in
                    request.requestedScopes = [.fullName, .email]
                },
                onCompletion: { result in
                    // Handle Apple Sign In
                    showMainApp = true
                }
            )
            .frame(height: Spacing.buttonHeight)
            .cornerRadius(Spacing.buttonCornerRadius)
            
            // Switch to Signup
            HStack {
                Text("Don't have an account?")
                    .font(.callout)
                    .foregroundColor(.textSecondary)
                
                Button("Sign Up") {
                    withAnimation(.spring()) {
                        isLoginMode = false
                    }
                }
                .font(.callout)
                .foregroundColor(.primary)
                .fontWeight(.semibold)
            }
        }
    }
}

struct SignupFormView: View {
    @Binding var isLoginMode: Bool
    @Binding var showMainApp: Bool
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        VStack(spacing: Spacing.xl) {
            // Title
            VStack(spacing: Spacing.sm) {
                Text("Create Account")
                    .font(.title1)
                    .foregroundColor(.textDark)
                    .fontWeight(.bold)
                
                Text("Join us today! Create your account to get started")
                    .font(.callout)
                    .foregroundColor(.textSecondary)
                    .multilineTextAlignment(.center)
            }
            .padding(.bottom, Spacing.lg)
            
            // Form Fields
            VStack(spacing: Spacing.lg) {
                CustomTextField(placeholder: "Email", text: $email)
                CustomTextField(placeholder: "Password", text: $password, isSecure: true)
                CustomTextField(placeholder: "Confirm Password", text: $confirmPassword, isSecure: true)
            }
            
            // Signup Button
            PrimaryButton(title: "Sign Up") {
                showMainApp = true
            }
            
            // Apple Sign In
            SignInWithAppleButton(
                .signUp, // Dynamically change button type
                onRequest: { request in
                    request.requestedScopes = [.fullName, .email]
                },
                onCompletion: { result in
                    // Handle Apple Sign In
                    showMainApp = true
                }
            )
            .frame(height: Spacing.buttonHeight)
            .cornerRadius(Spacing.buttonCornerRadius)
            
            // Switch to Login
            HStack {
                Text("Already have an account?")
                    .font(.callout)
                    .foregroundColor(.textSecondary)
                
                Button("Sign In") {
                    withAnimation(.spring()) {
                        isLoginMode = true
                    }
                }
                .font(.callout)
                .foregroundColor(.primary)
                .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    AuthenticationView(showMainApp: .constant(false))
}
