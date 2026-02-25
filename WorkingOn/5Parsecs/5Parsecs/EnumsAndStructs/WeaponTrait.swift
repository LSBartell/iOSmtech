//
//  WeaponTrait.swift
//  5Parsecs
//
//  Created by Logan Steven Bartell on 2/13/26.
//

import Foundation

enum WeaponTraitType: String, Codable {
    case pistol = "Pistol"
    case critical = "Critical"
    case melee = "Melee"
    case area = "Area"
    case clumsy = "Clumsy"
    case elegant = "Elegant"
    case focused = "Focused"
    case heavy = "Heavy"
    case impact = "Impact"
    case piercing = "Piercing"
    case singleUse = "Single Use"
    case snapShot = "Snap Shot"
    case stun = "Stun"
    case terrifying = "Terrifying"
}

struct WeaponTrait {
    let name: String
    let type: WeaponTraitType
    let weaponTraitDescription: String
}

extension WeaponTrait {
    static let pistol = WeaponTrait(name: "Pistol", type: .pistol, weaponTraitDescription: "+1 to Brawling rolls.")
    static let critical = WeaponTrait(name: "Critical", type: .critical, weaponTraitDescription: "A natural 6 on the to Hit roll will inflict 2 Hits on the target.")
    static let melee = WeaponTrait(name: "Melee", type: .melee, weaponTraitDescription: "+2 to Brawl Rolls.")
    static let area = WeaponTrait(name: "Area", type: .area, weaponTraitDescription: "Resolve all shots against the initial target. They cannot be spread. Then resolve one bonus shot against every figure within 2\".")
    static let clumsy = WeaponTrait(name: "Clumsy", type: .clumsy, weaponTraitDescription: "-1 to Brawling rolls, if opponent has higher speed.")
    static let elegant = WeaponTrait(name: "Elegant", type: .elegant, weaponTraitDescription: "When Brawling, the fighter may reroll the die. Enemies will always reroll if the have a lower total than their opponent, and can improve the result.")
    static let focused = WeaponTrait(name: "Focused", type: .focused, weaponTraitDescription: "All shots must be against a single target.")
    static let heavy = WeaponTrait(name: "Heavy", type: .heavy, weaponTraitDescription: "-1 penelty to Hit if the firer moved this round.")
    static let impact = WeaponTrait(name: "Impact", type: .impact, weaponTraitDescription: "If target is stunned, place a second Stun marker.")
    static let piercing = WeaponTrait(name: "Piercing", type: .piercing, weaponTraitDescription: "Ignore all armor Saving Throws.")
    static let singleUse = WeaponTrait(name: "Single Use", type: .singleUse, weaponTraitDescription: "The item can only be used once and must be deducted from the available supply. The Panic Fire rule (p.46) cannot be used with single use weapons.")
    static let snapShot = WeaponTrait(name: "Snap Shot", type: .snapShot, weaponTraitDescription: "+1 to hit within 6\"")
    static let stun = WeaponTrait(name: "Stun", type: .stun, weaponTraitDescription: "All targets are automatically stunned. No damage rolls take place.")
    static let terrifying = WeaponTrait(name: "Terrifying", type: .terrifying, weaponTraitDescription: "Any target hit must retreat 1d6\" away from the firer.")
}
