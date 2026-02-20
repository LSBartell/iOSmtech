//
//  Ship.swift
//  5Parsecs
//
//  Created by Logan Steven Bartell on 2/13/26.
//

import Foundation
import SwiftData

@Model
class Ship {
    var type: String
    var name: String
    var hull: Int
    var hullStarter: Int
    var debt: Int
    var debtStarter: Int
    var traits: [ShipTrait]
    var upgrades: [ShipUpgrade]
    
    init(type: String, name: String, hull: Int, hullStarter: Int, debt: Int, debtStarter: Int, traits: [ShipTrait], upgrades: [ShipUpgrade]) {
        self.type = type
        self.name = name
        self.hull = hull
        self.hullStarter = hullStarter
        self.debt = debt
        self.debtStarter = debtStarter
        self.traits = traits
        self.upgrades = upgrades
    }
    
    convenience init(copying ship: Ship) {
        self.init(
            type: ship.type,
            name: ship.name,
            hull: ship.hull,
            hullStarter: ship.hullStarter,
            debt: ship.debt,
            debtStarter: ship.debtStarter,
            traits: ship.traits,
            upgrades: ship.upgrades
        )
    }
}
    
extension Ship {
    
    //Generic Ship List
    
    private static let wornFreighter = Ship(
        type: "Worn Freighter",
        name: "",
        hull: 0, hullStarter: 30,
        debt: 0, debtStarter: 20,
        traits: [], upgrades: []
    )
    
    private static let retiredTroopTransport = Ship(
        type: "Retired Troop Transport",
        name: "",
        hull: 0, hullStarter: 35,
        debt: 0, debtStarter: 30,
        traits: [.emergancyDrives], upgrades: []
    )
    
    private static let strangeAlienVessel = Ship(
        type: "Strange Alien Vessel",
        name: "",
        hull: 0, hullStarter: 25,
        debt: 0, debtStarter: 15,
        traits: [], upgrades: []
    )
    
    private static let upgradedShuttle = Ship(
        type: "Upgraded Shuttle",
        name: "",
        hull: 0, hullStarter: 20,
        debt: 0, debtStarter: 10,
        traits: [], upgrades: []
    )
    
    private static let retiredScoutShip = Ship(
        type: "Retired Scout Ship",
        name: "",
        hull: 0, hullStarter: 25,
        debt: 0, debtStarter: 20,
        traits: [.fuelEfficient], upgrades: []
    )
    
    private static let repurposedScienceVessel = Ship(
        type: "Repurposed Science Vessel",
        name: "",
        hull: 0, hullStarter: 20,
        debt: 0, debtStarter: 10,
        traits: [], upgrades: []
    )
    
    private static let batteredMiningShip = Ship(
        type: "Battered Mining Ship",
        name: "",
        hull: 0, hullStarter: 35,
        debt: 0, debtStarter: 20,
        traits: [.fuelHog], upgrades: []
    )
    
    private static let unreliableMerchantCruiser = Ship(
        type: "Unreliable Merchant Cruiser",
        name: "",
        hull: 0, hullStarter: 30,
        debt: 0, debtStarter: 20,
        traits: [], upgrades: []
    )
    
    private static let formerDiplomaticVessel = Ship(
        type: "Former Diplomatic Vessel",
        name: "",
        hull: 0, hullStarter: 25,
        debt: 0, debtStarter: 15,
        traits: [], upgrades: []
    )
    
    private static let ancientLowTechCraft = Ship(
        type: "Ancient Low-Tech Craft",
        name: "",
        hull: 0, hullStarter: 35,
        debt: 0, debtStarter: 20,
        traits: [.dodgyDrive], upgrades: []
    )
    
    private static let builtFromSalvagedWrecks = Ship(
        type: "Built From Salvaged Wrecks",
        name: "",
        hull: 0, hullStarter: 30,
        debt: 0, debtStarter: 20,
        traits: [], upgrades: []
    )
    
    private static let wornColonyShip = Ship(
        type: "Worn Colony Ship",
        name: "",
        hull: 0, hullStarter: 25,
        debt: 0, debtStarter: 20,
        traits: [.standardIssue], upgrades: []
    )
    
    private static let retiredMilitaryPatrolShip = Ship(
        type: "Retired Military Patrol Ship",
        name: "",
        hull: 0, hullStarter: 40,
        debt: 0, debtStarter: 35,
        traits: [.armored], upgrades: []
    )
    
}
