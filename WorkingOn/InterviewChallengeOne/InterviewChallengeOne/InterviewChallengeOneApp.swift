//
//  InterviewChallengeOneApp.swift
//  InterviewChallengeOne
//
//  Created by Logan Steven Bartell on 2/24/26.
//
import SwiftData
import SwiftUI

@main
struct InterviewChallengeOneApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [User.self, UserList.self])
    }
}
