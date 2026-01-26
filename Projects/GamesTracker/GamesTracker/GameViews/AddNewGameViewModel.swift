//
//  AddNewGameViewModel.swift
//  GamesTracker
//
//  Created by Logan Steven Bartell on 12/12/25.
//
import Foundation
import SwiftUI
import SwiftData

@Observable
@MainActor
class AddNewGameViewModel {
    private let dataSource: SwiftDataService
    
    init(dataSource: SwiftDataService) {
        self.dataSource = dataSource
    }
    
    let gameIconList = GameIcon.allCases
    var isChoosingIcon = false
    var newGameName = ""
    var newGameIcon = GameIcon.run.rawValue
    var newGameType = SortType.highest
    var newGameWinnerType = SortType.highest
    var newGamePlayers: [Player] = []
    var isShowingAddPlayerAlert = false
    var newPlayerName = ""
    var newPlayerScore = 0
    
    func addPlayer() {
        newGamePlayers.append(Player(name: newPlayerName, score: 0))
        newPlayerName = ""
    }
    
    func cancelAddPlayer() {
        newPlayerName = ""
    }
    
    func saveGame() {
        dataSource.insert(Game(name: newGameName, icon: newGameIcon, sortType: newGameType.rawValue, winnerType: newGameWinnerType.rawValue, players: newGamePlayers))
        newGameName = ""
        newGameIcon = GameIcon.run.rawValue
        newGameType = SortType.highest
        newGameWinnerType = SortType.highest
        newGamePlayers = []
    }
    
    func cancel() {
        newGameName = ""
        newGameIcon = GameIcon.run.rawValue
        newGameType = SortType.highest
        newGameWinnerType = SortType.highest
        newGamePlayers = []
    }
}
