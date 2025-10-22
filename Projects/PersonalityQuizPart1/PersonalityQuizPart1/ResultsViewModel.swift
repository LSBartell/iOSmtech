//
//  ResultsViewModel.swift
//  PersonalityQuizPart1
//
//  Created by Logan Steven Bartell on 10/21/25.
//
import Foundation
import SwiftUI

@Observable
class ResultsViewModel {
    
    var quizManager: QuizManager?
    var quizAnswer = ""
    var answerDescription = ""
    
    func getMostCommonAnswer() {
        var result: [BattlefieldClass : Int] = [
            .assault : 0,
            .engineer : 0,
            .recon : 0,
            .support : 0
        ]
        
        var quizAnswertype: [BattlefieldClass] = []
        
        for question in quizManager?.questionList ?? [] {
            for type in question.savedAnswerType {
                switch type {
                case .assault:
                    result[.assault, default: 0] += 1
                case .engineer:
                    result[.engineer, default: 0] += 1
                case .recon:
                    result[.recon, default: 0] += 1
                case.support:
                    result[.support, default: 0] += 1
                }
            }
        }
        
        let mostCommonAnswerValue = result.sorted { $0.1 > $1.1 }.first!.value
        
        for member in result {
            if member.value == mostCommonAnswerValue {
                quizAnswertype.append(member.key)
            }
        }
        quizAnswer = quizAnswertype.randomElement()!.rawValue
        
        switch quizAnswer {
        case "Assault":
            answerDescription = "You like an agressive approach to problems!"
        case "Engineer":
            answerDescription = "You like to think your way out of problems!"
        case "Recon":
            answerDescription = "You are slow, careful and methodical with problems!"
        case "Support":
            answerDescription = "You boost others around you and work in a team to solve problems!"
        default:
            answerDescription = "Error"
        }
    }
}
