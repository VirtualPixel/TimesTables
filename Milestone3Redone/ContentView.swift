//
//  ContentView.swift
//  Milestone3Redone
//
//  Created by Justin Wells on 10/4/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var problems = Problems()
    
    let questionCount: Array = [5, 10, 20]
    let range = 2...12
    let impactMed = UIImpactFeedbackGenerator(style: .medium)
    
    //Settings
    @State private var questionSelection = 5
    @State private var multiplicationTable = 2
    //Animation Variables
    @State private var coinFlipAmount = 0.0
    //Game View
    @State private var settingsChosen = false
        
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button("-") {
                        decrease()
                    }
                    .buttonStyle(PlusMinusButtonStyle(value: multiplicationTable, min: range.lowerBound, max: 13))
                    
                    
                    Button("\(multiplicationTable)") {
                        let oldValue = multiplicationTable
                        
                        while oldValue == multiplicationTable {
                            withAnimation(.easeInOut(duration: 0.75)) {
                                coinFlipAmount += 1080
                                impactMed.impactOccurred()
                                multiplicationTable = Int.random(in: range)
                            }
                        }
                        
                        setProblems()
                    }
                    .buttonStyle(CoinButton())
                    .rotation3DEffect(.degrees(coinFlipAmount), axis: (x: 0, y: 1, z: 0))
                    
                    
                    Button("+") {
                        increase()
                    }
                    .buttonStyle(PlusMinusButtonStyle(value: multiplicationTable, min: 0, max: range.upperBound))
                }
                .padding()
                
                
                Text("How many questions?")
                    .foregroundColor(.black)
                Picker("How many questions?", selection: $questionSelection) {
                    ForEach(questionCount, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
                .onChange(of: questionSelection) { newValue in
                    setProblems()
                }
                Spacer()
                
                NavigationLink {
                    GameView(problems: problems)
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Text("PLAY")
                    .frame(width: 175, height: 100)
                    .background(.green)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .font(.system(size: 500))
                    .minimumScaleFactor(0.01)
                }
            }
            .padding()
            .navigationTitle("Times Tables")
        }
        .onAppear(perform: {
            setProblems()
        })
    }
        
    
    func decrease(){
        if multiplicationTable == range.lowerBound {
            impactMed.impactOccurred()
            return
        }
        multiplicationTable -= 1
        
        setProblems()
    }
    
    func increase(){
        if multiplicationTable == range.upperBound {
            impactMed.impactOccurred()
            return
        }
        multiplicationTable += 1
        
        setProblems()
    }
    
    func setProblems() {
        problems.problems = Problem(table: multiplicationTable, questions: questionSelection).generateQuestions()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
