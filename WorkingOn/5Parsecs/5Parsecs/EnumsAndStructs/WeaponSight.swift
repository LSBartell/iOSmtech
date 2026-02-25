//
//  WeaponSight.swift
//  5Parsecs
//
//  Created by Logan Steven Bartell on 2/20/26.
//
import Foundation

enum WeaponSightType {
    case laserSight
    case qualitySight
    case seekerSight
    case trackerSight
    case unityBattleSight
}

struct WeaponSight {
    let name: String
    let type: WeaponSightType
    let effects: String
}

extension WeaponSight {
    
    static let laserSight = WeaponSight(
        name: "Laser Sight",
        type: .laserSight,
        effects: "The weapon receives the Snap Shot trait. Pistol only."
    )
    
    static let qualitySight = WeaponSight(
        name: "Quality Sight",
        type: .qualitySight,
        effects: "+2\" Range increase. Reroll 1s when firing only one shot."
    )

    static let seekerSight = WeaponSight(
        name: "Seeker Sight",
        type: .seekerSight,
        effects: "The weapon receives +1 to Hit if the shooter did not move this round."
    )

    static let trackerSight = WeaponSight(
        name: "Tracker Sight",
        type: .trackerSight,
        effects: "+1 to Hit if you fired at the same target during your previous round."
    )

    static let unityBattleSight = WeaponSight(
        name: "Unity Battle Sight",
        type: .unityBattleSight,
        effects: "+1 to all Hit rolls."
    )
    
}
