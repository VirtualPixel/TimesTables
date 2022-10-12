//
//  CoinButton.swift
//  Milestone3
//
//  Created by Justin Wells on 10/4/22.
//

import Foundation
import SwiftUI

struct CoinButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .frame(width: 125, height: 125)
            .background(.gray)
            .clipShape(Circle())
            .font(.system(size: 500))
            .minimumScaleFactor(0.01)
        
    }
}
