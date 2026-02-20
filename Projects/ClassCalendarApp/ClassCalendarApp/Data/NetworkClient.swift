//
//  Untitled.swift
//  ClassCalendarApp
//
//  Created by Logan Steven Bartell on 11/6/25.
//
import Foundation

actor MocknetworkClient { // functions called by CalendarViewModel to populate the View Model, will eventually be replaced by real netwok calls
    func fetchDays() async throws -> [Day] {
        try await Task.sleep(nanoseconds: 500_000_000) //simulates network delay
        return [
            Day(date: Date.now, lessonID: "TP01", lessonName: "Learning iOS", mainObjective: "Learn how to code", readingDue: "Chapter1", assignmentsDue: [], newAssignments: [], dailyCodeChallenge: "For Loops", wordOfTheDay: "Variable"),
            Day(date: Date.now.advanced(by: 86400), lessonID: "TP02", lessonName: "Learning xcode", mainObjective: "Learn to use IDE", readingDue: "Chapter2", assignmentsDue: [], newAssignments: [], dailyCodeChallenge: "While Loops", wordOfTheDay: "IDE"),
            Day(date: Date.now.advanced(by: 172800), lessonID: "TP03", lessonName: "SwiftUI", mainObjective: "Learn to build views in SwiftUI", readingDue: "Chapter3", assignmentsDue: [], newAssignments: [], dailyCodeChallenge: "Complex Math", wordOfTheDay: "JSON")
        ]
    }
    func fetch(date: Date) async throws -> Day { // called in CalendarViewModel line 47
        try await Task.sleep(nanoseconds: 999_000_000)// simulates network delay
        return Day(date: date, lessonID: "TP01", lessonName: "Learning iOS", mainObjective: "Learn how to code", readingDue: "Chapter1", assignmentsDue: [], newAssignments: [], dailyCodeChallenge: "For Loops", wordOfTheDay: "Variable")
    }
}
