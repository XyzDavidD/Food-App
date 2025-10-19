//
//  CustomTextField.swift
//  Food App New
//
//  Created by Danciu David on 16.10.2025.
//

import SwiftUI

struct CustomTextField: View {
    let placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            if isSecure {
                SecureField(placeholder, text: $text)
                    .textFieldStyle(CustomTextFieldStyle())
            } else {
                TextField(placeholder, text: $text)
                    .textFieldStyle(CustomTextFieldStyle())
            }
        }
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, Spacing.lg)
            .padding(.vertical, Spacing.lg)
            .background(
                RoundedRectangle(cornerRadius: Spacing.textFieldCornerRadius)
                    .fill(Color.gray.opacity(0.1))
            )
            .overlay(
                RoundedRectangle(cornerRadius: Spacing.textFieldCornerRadius)
                    .stroke(Color.border, lineWidth: 1)
            )
    }
}

#Preview {
    VStack(spacing: 20) {
        CustomTextField(placeholder: "Email", text: .constant(""))
        CustomTextField(placeholder: "Password", text: .constant(""), isSecure: true)
    }
    .padding()
}
