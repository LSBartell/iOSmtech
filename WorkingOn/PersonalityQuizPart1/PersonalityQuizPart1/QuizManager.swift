//
//  Untitled.swift
//  PersonalityQuizPart1
//
//  Created by Logan Steven Bartell on 10/14/25.
//

import Foundation
@Observable
 class QuizManager: Identifiable {
    var id = UUID()
    
    var currentQuestion: Int = 0
    var selectedAnswers: [BattlefieldClass] = []
    var questionList: [Question] = [
        Question(
            text: "You have a difficult test coming up in a week, How would you spend your week to prepare for it?",
            type: .single,
            answers: [
                Answer(text: "Procrastinate until the last moment, then cram in information the night before.", type: .assault),
                Answer(text: "Create a cheat sheet on something discreet and bring it into the test.", type: .engineer),
                Answer(text: "Study the subject carefully every night.", type: .recon),
                Answer(text: "Get together with friends and form a study group.", type: .support)
            ],
            questionNumber: 0,
            savedAnswerType: []
        ),
        Question(
            text: "What kind of vehicles do you own and would like to own?",
            type: .multiple,
            answers: [
                Answer(text: "Sports Car", type: .assault),
                Answer(text: "Truck", type: .engineer),
                Answer(text: "Motorbike", type: .recon),
                Answer(text: "Van/Sports Utility", type: .support)
            ],
            questionNumber: 1,
            savedAnswerType: []
        ),
        Question(
            text: "How much do you enjoy eating spicy food?",
            type: .ranged,
            answers: [
                Answer(text: "Not at all", type: .support),
                Answer(text: "A little", type: .recon),
                Answer(text: "A fair amount", type: .engineer),
                Answer(text: "A lot", type: .assault)
            ],
            questionNumber: 2,
            savedAnswerType: []
        ),
        Question(
            text: "hello",
            type: .single,
            answers: [
                Answer(text: "sup", type: .assault),
                Answer(text: "yo", type: .engineer),
                Answer(text: "test", type: .recon),
                Answer(text: "testing", type: .support)
            ],
            questionNumber: 3,
            savedAnswerType: []
        )
    ]
}
