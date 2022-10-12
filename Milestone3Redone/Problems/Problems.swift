//
//  Problems.swift
//  Milestone3Redone
//
//  Created by Justin Wells on 10/6/22.
//

import Foundation

class Problems: ObservableObject {
    @Published var problems = [Problem]()
    
    /*let table: Int
    let questions: Int
    
    init(table: Int, questions: Int) {
        self.table = table
        self.questions = questions
    }
    
    func generateQuestions() -> [Problem] {
        var problems: [Problem] = []
        
        for i in 0..<questions {
            problems.append(Problem(table: table, multiplier: i))
        }
        
        return problems
    }
     */
}
