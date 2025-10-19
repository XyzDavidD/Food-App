//
//  PrimaryButton.swift
//  Food App New
//
//  Created by Danciu David on 16.10.2025.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    var isEnabled: Bool = true
    var isLoading: Bool = false
    
    var body: some View {
        Button(action: {
            action()
        }) {
            HStack {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(0.8)
                } else {
                    Text(title)
                        .font(.buttonText)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: Spacing.buttonHeight)
            .background(
                RoundedRectangle(cornerRadius: Spacing.buttonCornerRadius)
                    .fill(isEnabled ? Color.primary : Color.gray)
            )
        }
        .disabled(!isEnabled || isLoading)
        .animation(.easeInOut(duration: 0.2), value: isLoading)
    }
}

#Preview {
    VStack(spacing: 20) {
        PrimaryButton(title: "Get Started", action: {})
        PrimaryButton(title: "Loading...", action: {}, isLoading: true)
        PrimaryButton(title: "Disabled", action: {}, isEnabled: false)
    }
    .padding()
}
