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
    
}
