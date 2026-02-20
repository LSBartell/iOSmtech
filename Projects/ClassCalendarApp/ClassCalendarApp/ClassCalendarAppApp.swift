//
//  ClassCalendarAppApp.swift
//  ClassCalendarApp
//
//  Created by Logan Steven Bartell on 11/6/25.
//

import SwiftUI

@main
struct ClassCalendarAppApp: App {
    var body: some Scene {
        WindowGroup {
            UserSignInView(viewModel: UserSignInViewModel())
        }
    }
}
