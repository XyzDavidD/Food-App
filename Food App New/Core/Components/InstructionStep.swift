//
//  InstructionStep.swift
//  Food App New
//
//  Created by Danciu David on 16.10.2025.
//

import SwiftUI

struct InstructionStep: View {
    let instruction: Instruction
    
    var body: some View {
        HStack(alignment: .top, spacing: Spacing.md) {
            // Step Number
            Text("\(instruction.number)")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 28, height: 28)
                .background(Color.primary)
                .clipShape(Circle())
            
            // Step Text
            Text(instruction.step)
                .font(.bodyText)
                .foregroundColor(.textDark)
                .multilineTextAlignment(.leading)
            
            Spacer()
        }
        .padding(.vertical, Spacing.sm)
    }
}

#Preview {
    let sampleInstruction = Instruction(
        id: 1,
        step: "Wash and chop all vegetables into bite-sized pieces.",
        number: 1
    )
    
    InstructionStep(instruction: sampleInstruction)
        .padding()
}
