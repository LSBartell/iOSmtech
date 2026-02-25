//
//  ShipTraits.swift
//  5Parsecs
//
//  Created by Logan Steven Bartell on 2/13/26.
//

import Foundation

enum ShipTraitType: String, Codable {
    case armored = "Armored"
    case emergancyDrives = "Emergancy Drives"
    case fuelEfficient = "Fuel Efficient"
    case fuelHog = "Fuel Hog"
    case standardIssue = "Standard Issue"
    case dodgyDrive = "Dodgy Drive"
}

struct ShipTrait {
    let name: String
    let type: ShipTraitType
    let shipTraitDescription: String
}

extension ShipTrait {
    static let armored = ShipTrait(name: "Armored", type: .armored, shipTraitDescription: "Any time the ship takes damage, you lose 1 Hull point less than indicated by the rules.")
    static let emergancyDrives = ShipTrait(name: "Emergancy Drives", type: .emergancyDrives, shipTraitDescription: "If you have to preform an emergancy take-off while your ship is damaged, reduce the Hull damage sustained on the roll by 3.")
    static let fuelEfficient = ShipTrait(name: "Fuel Efficient", type: .fuelEfficient, shipTraitDescription: "When traveling to a new world, the fuel cost is reduced by 1 credit.")
    static let fuelHog = ShipTrait(name: "Fuel Hog", type: .fuelHog, shipTraitDescription: "When traveling to a new world, the fuel cost is increased by 1 credit.")
    static let standardIssue = ShipTrait(name: "Standard Issue", type: .standardIssue, shipTraitDescription: "The cost of all Starship Components(see p.60) is reduced by 1 credit.")
    static let dodgyDrive = ShipTrait(name: "Dodgy Drive", type: .dodgyDrive, shipTraitDescription: "Any time the ship takes Hull damage, roll 2D6. If the roll is equal to or below the amount of damage sustained, the drive is misbehaving, and 2 additional points of damage are sustained.")
}
