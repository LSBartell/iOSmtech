//
//  GamesTableViewModel.swift
//  GamesTracker
//
//  Created by Logan Steven Bartell on 12/10/25.
//
import Foundation
import SwiftUI
import SwiftData

    @MainActor
    @Observable
    class GamesTableViewModel {
        let dataSource: SwiftDataService
        
        enum orderOrganize: String {
            case highest = "highest"
            case lowest = "lowest"
        }
        
        var games: [Game] = []
        var editGameShowing = false
        var newGameName = "new game"
        var newGamePlayerOrder: orderOrganize = .highest
        var newGameWinnerType: orderOrganize = .highest
        var newGamePlayers: [Player] = []
        var newGameIcon: GameIcon = .run
        
        init(dataSource: SwiftDataService) {
            self.dataSource = dataSource
            fetchGames()
        }
        
        func fetchGames() {
            games = dataSource.fetchGames()
            print(games.count)
        }
        
        func didAddNewGame() {
            let newGame = Game(name: newGameName, icon: newGameIcon.rawValue, sortType: newGamePlayerOrder.rawValue, winnerType: newGameWinnerType.rawValue, players: newGamePlayers)
            dataSource.insert(newGame)
            fetchGames()
        }
        
        func didDeleteGame(_ offsets: IndexSet) {
            for index in offsets {
                dataSource.delete(games[index])
            }
            fetchGames()
        }
        
        func didToggleGameEdit() {
            editGameShowing.toggle()
        }
        
        func didEditGame() {
            try? dataSource.modelContext.save()
        }
        
        func moveGame(from source: IndexSet, to destination: Int) {
            games.move(fromOffsets: source, toOffset: destination)
        }
    }

