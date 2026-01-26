//
//  Player.swift
//  GamesTracker
//
//  Created by Logan Steven Bartell on 12/10/25.
//
import Foundation
import SwiftData

@Model
class Player {
    var name: String
    var score: Int
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}
