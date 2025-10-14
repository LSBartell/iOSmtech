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
