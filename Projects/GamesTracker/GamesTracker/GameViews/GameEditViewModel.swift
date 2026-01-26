//
//  GameEditViewModel.swift
//  GamesTracker
//
//  Created by Logan Steven Bartell on 12/18/25.
//
import Foundation
import SwiftUI
import SwiftData

@Observable
@MainActor
class GameEditViewModel {
    private let dataSource: SwiftDataService
    var game: Game
    var newPlayerName = ""
    var isShowingAddPlayerAlert = false
    //    let gameId: PersistentIdentifier
    
    init(dataSource: SwiftDataService, game: Game) {
        self.dataSource = dataSource
        self.game = game
        //        gameId = game.persistentModelID
    }
    
    func addPlayer() {
        game.players.append(Player(name: newPlayerName, score: 0))
        dataSource.insert(Player(name: newPlayerName, score: 0))
        newPlayerName = ""
    }
    
    func cancelAddPlayer() {
        newPlayerName = ""
    }
}
