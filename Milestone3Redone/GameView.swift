//
//  GameView.swift
//  Milestone3
//
//  Created by Justin Wells on 10/4/22.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var problems: Problems
    @State private var gameOver = false
    @Environment(\.dismiss) var dismiss
    
    
    @State private var count = 0
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("\(problems.problems[0].table)")
                        .frame(width: 100)
                        .font(.system(size: 150))
                        .minimumScaleFactor(0.01)
                        .padding()
                        .foregroundColor(.black)
                    
                    Text("x")
                        .frame(width: 50)
                        .font(.system(size: 50))
                        .minimumScaleFactor(0.01)
                        .padding()
                        .foregroundColor(.black)
                    Text("\(problems.problems[0].multiplier)")
                        .frame(width: 100)
                        .font(.system(size: 150))
                        .minimumScaleFactor(0.01)
                        .padding()
                        .foregroundColor(.black)
                }
                Spacer()
                
                HStack {
                    ForEach(0..<2){ number in
                        Button("1") {
                            count += 1
                        }
                        .buttonStyle(PossibleAnswer())
                    }
                }
                HStack {
                    ForEach(2..<4){ number in
                        Button("2") {
                            if count >= 5 {
                                dismiss()
                            }
                        }
                        .buttonStyle(PossibleAnswer())
                    }
                }
            }
        }
    }
    
    func gameManagement() {
        
    }
    
    func correct() {
        
    }
    
    func incorrect() {
        
    }
}

struct GameView_Previews: PreviewProvider {    
    static var previews: some View {
        GameView(problems: Problems())
    }
}
