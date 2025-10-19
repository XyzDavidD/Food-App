//
//  HapticFeedback.swift
//  Food App New
//
//  Created by Danciu David on 16.10.2025.
//

import SwiftUI

struct HapticFeedback {
    static func light() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
    }
}
