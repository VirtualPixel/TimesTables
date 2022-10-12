//
//  PlusMinusButton.swift
//  Milestone3
//
//  Created by Justin Wells on 10/4/22.
//

import Foundation
import SwiftUI

struct PlusMinusButtonStyle: ButtonStyle {
    let value: Int
    let min: Int
    let max: Int
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 100, height: 100)
            .background((value == min || value == max) ? .red : .green)
            .foregroundColor(.white)
            .font(.system(size: 500))
            .minimumScaleFactor(0.01)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}
