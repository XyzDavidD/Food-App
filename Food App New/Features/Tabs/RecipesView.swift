//
//  RecipesView.swift
//  Food App New
//
//  Created by Danciu David on 16.10.2025.
//

import SwiftUI

struct RecipesView: View {
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Recipes")
                    .font(.largeTitle)
                    .foregroundColor(.textDark)
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    RecipesView()
}
