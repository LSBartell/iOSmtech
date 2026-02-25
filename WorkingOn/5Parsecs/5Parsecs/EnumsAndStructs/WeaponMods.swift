//
//  WeaponMods.swift
//  5Parsecs
//
//  Created by Logan Steven Bartell on 2/13/26.
//

import Foundation

enum WeaponModType {
    case assaultBlade
    case beamLight
    case bipod
    case hotShotPack
    case cyberConfigurableNanoSludge
    case stabilizer
    case shockAttachment
    case upgradeKit
}

struct WeaponMod {
    let name: String
    let type: WeaponModType
    let effects: String
}

extension WeaponMod {
    
    static let assaultBlade = WeaponMod(name: "Assault Blade", type: .assaultBlade, effects: "The weapon gains the Melee trait. Damage +1, and wins combat on a Draw. Non-Pistol only.")
    
    static let beamLight = WeaponMod(
        name: "Beam Light",
        type: .beamLight,
        effects: "When using the weapon in conditions of reduced visibility, increase visibility by +3\"."
    )
    
    static let bipod = WeaponMod(
        name: "Bipod",
        type: .bipod,
        effects: "The weapon receives +1 to Hit at ranges over 8\" when Aiming or when firing from cover. Non-Pistol only"
    )
    
    static let hotShotPack = WeaponMod(
        name: "Hot Shot pack",
        type: .hotShotPack,
        effects: "If fitted to a Blast Pistol, Blast Rifle, Hand Laser, or Infantry Laser, +1 Damage. Any natural 6 on the shooting dice causes an overheat, rendering the weapon inoperable for the rest of the fight."
    )
    
    static let cyberConfigurableNanoSludge = WeaponMod(
        name: "Cyber-configurable Nano-sludge",
        type: .cyberConfigurableNanoSludge,
        effects: "The weapon recieves a permanent +1 Hit bonus."
    )
    
    static let stabilizer = WeaponMod(
        name: "Stabilizer",
        type: .stabilizer,
        effects: "Weapon may ignore Heavy trait."
    )
    
    static let shockAttachment = WeaponMod(
        name: "Shock attachment",
        type: .shockAttachment,
        effects: "The weapon receives the Impact trait against targets with 8\" range."
    )
    
    static let upgradeKit = WeaponMod(
        name: "Upgrade kit",
        type: .upgradeKit,
        effects: "+2\" Range increase."
    )
    
}
