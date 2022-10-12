//
//  PossibleAnswer.swift
//  Milestone3
//
//  Created by Justin Wells on 10/4/22.
//

import Foundation
import SwiftUI

struct PossibleAnswer: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 150, height: 150)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(randomColor(), lineWidth: 5)
            )
            .font(.system(size: 150))
            .minimumScaleFactor(0.01)
            .padding(20)
            .foregroundColor(.black)
    }
    
    func randomColor() -> Color {
        let colors: [Color] = [.red, .yellow, .green, .blue, .purple, .pink, .cyan, .orange, .brown, .indigo, .mint]
        return colors.randomElement() ?? .gray
    }
}
