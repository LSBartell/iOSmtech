//
//  InterviewChallengeTwoApp.swift
//  InterviewChallengeTwo
//
//  Created by Logan Steven Bartell on 2/25/26.
//

import SwiftUI

@main
struct InterviewChallengeTwoApp: App {
    var body: some Scene {
        WindowGroup {
            UsersView(viewModel: ViewModel())
        }
    }
}
