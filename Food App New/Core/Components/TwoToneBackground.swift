//
//  TwoToneBackground.swift
//  Food App New
//
//  Created by Danciu David on 16.10.2025.
//

import SwiftUI

struct TwoToneBackground: View {
    var topColor: Color = Color.primary.opacity(0.3) // Default to darker primary opacity
    var bottomColor: Color = .background // Default to pure white
    var splitPercentage: CGFloat = 0.42 // 42% from the top

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                topSection(geometry: geometry)
                bottomSection()
            }
            .ignoresSafeArea()
        }
    }

    private func topSection(geometry: GeometryProxy) -> some View {
        topColor
            .frame(height: geometry.size.height * splitPercentage)
    }

    private func bottomSection() -> some View {
        bottomColor
    }
}

#Preview {
    TwoToneBackground()
}
