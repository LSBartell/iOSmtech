//
//  SwiftDataService.swift
//  GamesTracker
//
//  Created by Logan Steven Bartell on 12/11/25.
//
import Foundation
import SwiftData

@MainActor
class SwiftDataService {
    let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func insert(_ object: AnyObject) {
        if let object = object as? Game {
            modelContext.insert(object)
            try? modelContext.save()
            print("game saved")
        } else if let object = object as? Player {
            modelContext.insert(object)
            try? modelContext.save()
        } else {
            print("Invalide type")
        }
    }
    
    func delete(_ object: AnyObject) {
        if let object = object as? Game {
            modelContext.delete(object)
            try? modelContext.save()
        } else if let object = object as? Player {
            modelContext.delete(object)
            try? modelContext.save()
        } else {
            print("Invalide type")
        }
    }
    
    func fetchGames() -> [Game] {
        let fetchDescriptor = FetchDescriptor<Game>(sortBy: [SortDescriptor(\.name, order: .forward)])
        do {
            return try modelContext.fetch(fetchDescriptor)
        } catch {
            print("Failed to fetch games: \(error)")
            return []
        }
    }
    
    func fetchPlayers() -> [Player] {
        let fetchDescriptor = FetchDescriptor<Player>(sortBy: [SortDescriptor(\.score, order: .forward)])
        do {
            return try modelContext.fetch(fetchDescriptor)
        } catch {
            print("Failed to fetch players: \(error)")
            return []
        }
    }
    
    
}

//creates a modelcontext for previews that is only stored in current local memory
extension SwiftDataService {
    static var preview: SwiftDataService {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let modelContext = ModelContext(try! ModelContainer(for: Game.self, configurations: configuration))
        
        let game = Game(name: "Fake game", icon: "figure.run.circle", sortType: "highest", winnerType: "highest", players: [Player(name: "Player1", score: 18), Player(name: "Player2", score: 20), Player(name: "Player3", score: 15)])
        
        modelContext.insert(game)
        
        return SwiftDataService(modelContext: modelContext)
    }
}
