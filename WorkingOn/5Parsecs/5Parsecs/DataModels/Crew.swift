//
//  Crew.swift
//  5Parsecs
//
//  Created by Logan Steven Bartell on 2/13/26.
//
import Foundation
import SwiftData

@Model
class Crew {
    var name: String
    var storyPoints: Int
    var notes: String
    var stash: Stash
    var rivals: Int
    var patrons: Int
    var characters: [Character]
    var ship: Ship
    
    init(name: String, storyPoints: Int, notes: String, stash: Stash, rivals: Int, patrons: Int, characters: [Character], ship: Ship) {
        self.name = name
        self.storyPoints = storyPoints
        self.notes = notes
        self.stash = stash
        self.rivals = rivals
        self.patrons = patrons
        self.characters = characters
        self.ship = ship
    }
    
}
