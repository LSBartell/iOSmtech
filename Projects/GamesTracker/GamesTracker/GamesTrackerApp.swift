//
//  GamesTrackerApp.swift
//  GamesTracker
//
//  Created by Logan Steven Bartell on 12/10/25.
//

import SwiftUI
import SwiftData

@main
struct GamesTrackerApp: App {
    let modelContainer: ModelContainer
    
    var body: some Scene {
        WindowGroup {
            GamesTableView(viewModel: GamesTableViewModel(dataSource: SwiftDataService(modelContext: modelContainer.mainContext)))
        }
        .modelContainer(modelContainer)
    }
    
    init() {
        do {
            modelContainer = try ModelContainer(for: Game.self, Player.self)
        } catch {
            fatalError("failed to create ModelConatiner: \(error.localizedDescription)")
        }
    }
}


