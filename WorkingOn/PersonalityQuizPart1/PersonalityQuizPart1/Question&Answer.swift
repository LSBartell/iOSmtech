//
//  Untitled.swift
//  PersonalityQuizPart1
//
//  Created by Logan Steven Bartell on 10/13/25.
//
import Foundation

struct Question: Identifiable {
    var id = UUID()
    
    var text: String
    var type: ResponseType
    var answers: [Answer]
    var questionNumber: Int
    var savedAnswerType: [BattlefieldClass]
    var savedAnswer1 = false
    var savedAnswer2 = false
    var savedAnswer3 = false
    var savedAnswer4 = false
    var savedSliderValue: Double = 0
    
}
enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: BattlefieldClass
}
enum BattlefieldClass {
    case assault, engineer, recon, support
}
