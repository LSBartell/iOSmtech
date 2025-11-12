//
//  Day.swift
//  ClassCalendarApp
//
//  Created by Logan Steven Bartell on 11/6/25.
//
import Foundation

struct Day: Identifiable {
    var id = UUID()
    
    var date: Date
    let lessonID: String
    let lessonName: String
    let mainObjective: String
    let readingDue: String
    let assignmentsDue: String
    let newAssignments: String
    let daiyCodeChallenge: String
    let wordOfTheDay: String
}
