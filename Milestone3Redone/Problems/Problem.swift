//
//  Problem.swift
//  Milestone3Redone
//
//  Created by Justin Wells on 10/6/22.
//

import Foundation
import SwiftUI

struct Problem {
    var table: Int = 2
    var questions: Int = 5
    var multiplier: Int = 0
    
    var answer: Int {
        table * multiplier
    }
    
    var possibleAnswers: [Int] {
        var answers: Set = [answer]
        let min: Int
        let max: Int
        
        if answer == 0 {
            min = table
            max = table * 3
        } else {
            min = answer / 2
            max = answer * 3
        }
        
        while answers.count < 4 {
            answers.insert(Int.random(in: min...max))
        }
        
        return Array(answers).shuffled()
    }
    
    func generateQuestions() -> [Problem] {
        var problems: [Problem] = []
        
        for i in 0..<questions {
            problems.append(Problem(table: table, multiplier: i))
        }
        
        return problems
    }
}
