//
//  ScanView.swift
//  Food App New
//
//  Created by Danciu David on 16.10.2025.
//

import SwiftUI

struct ScanView: View {
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Scan")
                    .font(.largeTitle)
                    .foregroundColor(.textDark)
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    ScanView()
}
