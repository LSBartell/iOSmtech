//
//  JournalAppApp.swift
//  JournalApp
//
//  Created by Logan Steven Bartell on 12/2/25.
//

import SwiftUI
import SwiftData

@main
struct JournalAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: JournalEntry.self)
    }
}
