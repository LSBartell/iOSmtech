//
//  Day.swift
//  ClassCalendarApp
//
//  Created by Logan Steven Bartell on 11/6/25.
//
import Foundation
//struct for a day, used to build days in networkclient and stored in calenader view model

struct Day: Identifiable, Codable, Hashable {
    var id = UUID()
    
    var date: Date
    let lessonID: String?
    let lessonName: String?
    let mainObjective: String?
    let readingDue: String?
    let assignmentsDue: [Assignment]
    let newAssignments: [Assignment]
    let dailyCodeChallenge: String?
    let wordOfTheDay: String?
    
    enum CodingKeys: String, CodingKey {
        case date
        case lessonID = "dayID"
        case lessonName
        case mainObjective
        case readingDue
        case dailyCodeChallenge = "dailyCodeChallengeName"
        case wordOfTheDay
        case assignmentsDue
        case newAssignments
    }
}

struct DaysResponse: Codable {
    let response: [Day]
}
