//
//  Game.swift
//  GamesTracker
//
//  Created by Logan Steven Bartell on 12/10/25.
//
import Foundation
import SwiftData


@Model
class Game {
    
    var name: String
    var icon: String
    var sortType: String
    var winnerType: String
    var winner: String {
        guard !self.players.isEmpty else { return "No Players"}
        
        var winner = self.players[0]
        var tied = false
        var winners: [Player] = []
        
        if self.winnerType == "highest" {
            for player in self.players {
                if player.score > winner.score {
                    winner = player
                }
            }
        } else if self.winnerType == "lowest" {
            for player in self.players {
                if player.score < winner.score {
                    winner = player
                }
            }
        }
        for player in self.players {
            if player.name != winner.name && player.score == winner.score {
                tied = true
                winners.append(player)
            }
        }
        
        if tied == true {
            var winnersNames = winner.name
            for tiedWinner in winners {
                winnersNames.append(" & \(tiedWinner.name)")
            }
            return "Tied: \(winnersNames)"
        } else {
            return winner.name
        }
    }
    @Relationship(deleteRule: .cascade) var players = [Player]()
    
    init(name: String, icon: String, sortType: String, winnerType: String, players: [Player]) {
        self.name = name
        self.sortType = sortType
        self.winnerType = winnerType
        self.players = players
        self.icon = icon
    }
}
