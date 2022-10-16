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
    @State private var right = 0
    @State private var wrong = 0
    
    var body: some View {
        let possibleAnswers: [Int] = problems.problems[count].possibleAnswers
        
        NavigationView {
            VStack {
                HStack {
                    Text("\(problems.problems[count].table)")
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
                    
                    Text("\(problems.problems[count].multiplier)")
                        .frame(width: 100)
                        .font(.system(size: 150))
                        .minimumScaleFactor(0.01)
                        .padding()
                        .foregroundColor(.black)
                }
                Spacer()
                
                HStack {
                    ForEach(0..<2){ number in
                        Button("\(possibleAnswers[number])") {
                            gameManagement(guess: possibleAnswers[number])
                        }
                        .buttonStyle(PossibleAnswer())
                    }
                }
                HStack {
                    ForEach(2..<4){ number in
                        Button("\(possibleAnswers[number])") {
                            gameManagement(guess: possibleAnswers[number])
                        }
                        .buttonStyle(PossibleAnswer())
                    }
                }
            }
            .alert("Game Over!", isPresented: $gameOver) {
                Button("Okay", role: .cancel) { endGame() }
            } message: {
                Text("You completed the game. Out of \(problems.problems.count) questions, you got \(right) correct, and \(wrong) incorrect.")
            }
        }
    }
    
    func gameManagement(guess: Int) {
        guess == problems.problems[count].answer ? correct() : incorrect()
        
        count < problems.problems.count - 1 ? nextRound() : gameOver.toggle()
    }
    
    func correct() {
        right+=1
    }
    
    func incorrect() {
        wrong+=1
    }
    
    func nextRound() {
        count+=1
    }
    
    func endGame() {
        dismiss()
    }
}

struct GameView_Previews: PreviewProvider {    
    static var previews: some View {
        GameView(problems: Problems())
    }
}
