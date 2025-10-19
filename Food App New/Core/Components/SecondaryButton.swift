//
//  SecondaryButton.swift
//  Food App New
//
//  Created by Danciu David on 16.10.2025.
//

import SwiftUI

struct SecondaryButton: View {
    let title: String
    let action: () -> Void
    var isEnabled: Bool = true
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .font(.buttonText)
                .foregroundColor(isEnabled ? Color.primary : Color.gray)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .frame(height: Spacing.buttonHeight)
                .background(
                    RoundedRectangle(cornerRadius: Spacing.buttonCornerRadius)
                        .stroke(isEnabled ? Color.primary : Color.gray, lineWidth: 2)
                )
        }
        .disabled(!isEnabled)
    }
}

#Preview {
    VStack(spacing: 20) {
        SecondaryButton(title: "Cancel", action: {})
        SecondaryButton(title: "Disabled", action: {}, isEnabled: false)
    }
    .padding()
}
