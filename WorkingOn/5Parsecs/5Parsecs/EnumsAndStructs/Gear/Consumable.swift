//
//  Consumables.swift
//  5Parsecs
//
//  Created by Logan Steven Bartell on 2/20/26.
//
import Foundation

struct Consumable {
    let name: String
    let effect: String
}

extension Consumable {
    
    static let boosterPills = Consumable(
        name: "Booster Pills",
        effect: "When taken, the character removes all Stun Markers. They may move at double normal Speed this round."
    )
    
    static let combatSerum = Consumable(
        name: "Combat Serum",
        effect: "The character receives +2\" Speed and +2 Reactions for the rest of the battle."
    )
    
    static let kiraninCrystals = Consumable(name: "Kiranin Crystals", effect: "")
    
    
    
}
