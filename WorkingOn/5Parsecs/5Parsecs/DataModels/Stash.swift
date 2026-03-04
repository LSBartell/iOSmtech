//
//  Stash.swift
//  5Parsecs
//
//  Created by Logan Steven Bartell on 2/13/26.
//
import Foundation
import SwiftData

@Model
class Stash {
    var weapons: [Weapon]
    var gear: [Gear]
    var credits: Int
    var weaponMods: [WeaponMod]
    var shipUpgrades: [ShipUpgrade]
    
    init(weapons: [Weapon], gear: [Gear], credits: Int) {
        self.weapons = weapons
        self.gear = gear
        self.credits = credits
    }
}

struct Gear {
    var consumables: [Consumable]
    var implants: [Implant]
    var onBoardDevices: [OnBoardDevice]
    var armors: [Armor]
    var screens: [Screen]
    var utilityDevices: [UtilityDevice]
}
