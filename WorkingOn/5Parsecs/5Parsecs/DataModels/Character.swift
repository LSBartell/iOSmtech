//
//  Character.swift
//  5Parsecs
//
//  Created by Logan Steven Bartell on 2/13/26.
//

import Foundation
import SwiftData

@Model
class Character {
    var name: String
    var notes: String
    var species: Species
    var reactions: Int
    var speed: Int
    var combat: Int
    var toughness: Int
    var savvy: Int
    var weapons: [Weapon]
    var implants: [Implant]
    
    init(name: String, notes: String, species: Species, reactions: Int, speed: Int, combat: Int, toughness: Int, savvy: Int, weapons: [Weapon], implants: [Implant]) {
        self.name = name
        self.notes = notes
        self.species = species
        self.reactions = reactions
        self.speed = speed
        self.combat = combat
        self.toughness = toughness
        self.savvy = savvy
        self.weapons = weapons
        self.implants = implants
    }
}
