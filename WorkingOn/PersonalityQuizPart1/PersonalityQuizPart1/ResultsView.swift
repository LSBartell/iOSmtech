//
//  ResultsView.swift
//  PersonalityQuizPart1
//
//  Created by Logan Steven Bartell on 10/13/25.
//

import SwiftUI

struct ResultsView: View {
    @Environment(QuizManager.self) var quizManager
    @State var quizAnswer = ""
    @State var answerDescription = ""
    
    func getMostCommonAnswer() {
        var result: [BattlefieldClass : Int] = [
            .assault : 0,
            .engineer : 0,
            .recon : 0,
            .support : 0
        ]
        
        var quizAnswertype: [BattlefieldClass] = []
        
        for question in quizManager.questionList {
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
    
    var body: some View {
        @Bindable var quizManager = quizManager
        ZStack {
            Image("TitleImage")
                .resizable()
                .scaledToFill()
                .frame(height: 900)
                .ignoresSafeArea()
            VStack {
                Spacer()
                    .frame(height: 100)
                Text(quizAnswer)
                    .font(.custom("Copperplate", size: 55))
                    .bold()
                    .foregroundStyle(Gradient(colors: [.white, .gray]))
                    .padding(4)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .glassEffect(.clear)
                            .foregroundStyle(.orange)
                    )
                Text(answerDescription)
                    .frame(width: 350)
                    .font(.custom("Copperplate", size: 20))
                    .foregroundStyle(.white)
                    .bold()
                    .padding(3)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .glassEffect(.clear)
                    )
                Spacer()
                    .frame(height: 200)
            }
        }
        .onAppear(perform: getMostCommonAnswer)
    }
}

