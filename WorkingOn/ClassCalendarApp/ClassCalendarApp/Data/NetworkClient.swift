//
//  Untitled.swift
//  ClassCalendarApp
//
//  Created by Logan Steven Bartell on 11/6/25.
//
import Foundation

actor MocknetworkClient { // functions called by CalendarViewModel to populate the View Model, will eventually be replaced by real netwok calls
    func fetchDays() async throws -> [Day] {
        try await Task.sleep(nanoseconds: 50_000_000) //simulates network delay
        return [
            Day(date: Date(year: 2025, month: Month(fullName: "November", monthNumber: 11), dayInMonth: 15), lessonID: "one1", lessonName: "Learning iOS", mainObjective: "Learn how to code", readingDue: "Chapter1", assignmentsDue: "Nothing due", newAssignments: "Read Chapter2", daiyCodeChallenge: "For Loops", wordOfTheDay: "Variable"),
            Day(date: Date(year: 2025, month: Month(fullName: "November", monthNumber: 11), dayInMonth: 16), lessonID: "two2", lessonName: "Learning xcode", mainObjective: "Learn to use IDE", readingDue: "Chapter2", assignmentsDue: "Playgrounds Lab", newAssignments: "Read Chapter3", daiyCodeChallenge: "While Loops", wordOfTheDay: "IDE"),
            Day(date: Date(year: 2025, month: Month(fullName: "November", monthNumber: 11), dayInMonth: 16), lessonID: "three3", lessonName: "SwiftUI", mainObjective: "Learn to build views in SwiftUI", readingDue: "Chapter3", assignmentsDue: "Loops Lab", newAssignments: "Read Chpter4", daiyCodeChallenge: "Complex Math", wordOfTheDay: "JSON")
        ]
    }
    func fetchToday() async throws -> Day {
        try await Task.sleep(nanoseconds: 30_000_000)// simulates network delay
        return Day(date: Date(year: 2025, month: Month(fullName: "November", monthNumber: 11), dayInMonth: 15), lessonID: "one1", lessonName: "Learning iOS", mainObjective: "Learn how to code", readingDue: "Chapter1", assignmentsDue: "Nothing due", newAssignments: "Read Chapter2", daiyCodeChallenge: "For Loops", wordOfTheDay: "Variable")
    }
}
