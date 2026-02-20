//
//  Weapon.swift
//  5Parsecs
//
//  Created by Logan Steven Bartell on 2/13/26.
//

import Foundation
import SwiftData

@Model
class Weapon {
    var type: String
    var weaponDescription: String
    var name: String?
    var range: Int
    var shots: Int
    var damage: Int
    var traits: [WeaponTrait]
    var mods: [WeaponMods]
    
    init(type: String, weaponDescription: String, name: String? = nil, range: Int, shots: Int, damage: Int, traits: [WeaponTrait], mods: [WeaponMods]) {
        self.type = type
        self.weaponDescription = weaponDescription
        self.name = name
        self.range = range
        self.shots = shots
        self.damage = damage
        self.traits = traits
        self.mods = mods
    }

    //used to get a weapon from the static list of weapons without tying them together due to them being a class reference type
    convenience init(copying weapon: Weapon) {
        self.init(
            type: weapon.type,
            weaponDescription: weapon.weaponDescription,
            name: weapon.name,
            range: weapon.range,
            shots: weapon.shots,
            damage: weapon.damage,
            traits: weapon.traits,
            mods: weapon.mods
        )
    }
    //call using let copy = Weapon(copying: existingWeapon)
    
    //list of weapons in the game
    private static let autoRifle = Weapon(
        type: "Auto Rifle",
        weaponDescription: "A heavy rifle fitted with an ammo drum, and used for medium-range fire support.",
        range: 24, shots: 2, damage: 0,
        traits: [], mods: [])
    
    private static let beamPistol = Weapon(
        type: "Beam Pistol",
        weaponDescription: "Military-grade heavy-energy pistol with a tightly focused beam",
        range: 10, shots: 1, damage: 1,
        traits: [.critical, .pistol], mods: [])
    
    private static let blade = Weapon(
        type: "Blade",
        weaponDescription: "Sturdy, light-weight fencing or slashing blade, favored for boarding actions",
        range: 0, shots: 0, damage: 0,
        traits: [.melee], mods: [])
    
    private static let blastPistol = Weapon(
        type: "Blast Pistol",
        weaponDescription: "Projects a bolt of searing energy which detonates on impact. Dissipation is rapid, giving the weapon limited range.",
        range: 8, shots: 1, damage: 1,
        traits: [.pistol], mods: [])

    private static let blastRifle = Weapon(
        type: "Blast Rifle",
        weaponDescription: "Rifle or carbine energy bolt weapon. Signifies that the user means business.",
        range: 16, shots: 1, damage: 1,
        traits: [], mods: [])

    private static let boardingSaber = Weapon(
        type: "Boarding Saber",
        weaponDescription: "A heavy but carefully balanced sword. Often fitted with hand guards.",
        range: 0, shots: 0, damage: 1,
        traits: [.melee, .elegant], mods: [])

    private static let brutalMeleeWeapon = Weapon(
        type: "Brutal Melee Weapon",
        weaponDescription: "A heavy, unpleasant-looking weapon for smashing and breaking things… or people.",
        range: 0, shots: 0, damage: 1,
        traits: [.melee, .clumsy], mods: [])

    private static let clingFirePistol = Weapon(
        type: "Cling Fire Pistol",
        weaponDescription: "Side arm firing a spray of sticky, burning chemicals.",
        range: 12, shots: 2, damage: 1,
        traits: [.focused, .terrifying], mods: [])

    private static let colonyRifle = Weapon(
        type: "Colony Rifle",
        weaponDescription: "Standard-type defensive rifle, popular with colonists and frontier folk. Simple to maintain. Typically semi-automatic.",
        range: 18, shots: 1, damage: 0,
        traits: [], mods: [])

    private static let dazzleGrenade = Weapon(
        type: "Dazzle Grenade",
        weaponDescription: "Shock charge emitting a loud flash and deafening sound.",
        range: 6, shots: 1, damage: 0,
        traits: [.area, .stun, .singleUse], mods: [])

    private static let duellingPistol = Weapon(
        type: "Duelling Pistol",
        weaponDescription: "Custom-made pistol built for careful aiming. Popular with the fabulously wealthy or old-fashioned.",
        range: 8, shots: 1, damage: 0,
        traits: [.pistol, .critical], mods: [])

    private static let flakGun = Weapon(
        type: "Flak Gun",
        weaponDescription: "Powerful military shotgun, designed for boarding operations and bug hunts in close quarters.",
        range: 8, shots: 2, damage: 1,
        traits: [.focused, .critical], mods: [])

    private static let frakkGrenade = Weapon(
        type: "Frakk Grenade",
        weaponDescription: "Explosive charge surrounded by a metal casing. Often improvised.",
        range: 6, shots: 2, damage: 0,
        traits: [.heavy, .area, .singleUse], mods: [])

    private static let furyRifle = Weapon(
        type: "Fury Rifle",
        weaponDescription: "High-powered beam weapon modified from military anti-tank designs. Slow build-up before discharge.",
        range: 24, shots: 1, damage: 2,
        traits: [.heavy, .piercing], mods: [])

    private static let glareSword = Weapon(
        type: "Glare Sword",
        weaponDescription: "Elegant fencing weapon. The blade is encased in a disruptive energy field, allowing it to cut with great precision.",
        range: 0, shots: 0, damage: 0,
        traits: [.melee, .elegant, .piercing], mods: [])

    private static let handCannon = Weapon(
        type: "Hand Cannon",
        weaponDescription: "Heavy pistol in a massive caliber. Appreciated by bug hunters.",
        range: 8, shots: 1, damage: 2,
        traits: [.pistol], mods: [])

    private static let handFlamer = Weapon(
        type: "Hand Flamer",
        weaponDescription: "Portable flame-throwing device with a broad focus for area effect.",
        range: 12, shots: 2, damage: 1,
        traits: [.focused, .area], mods: [])

    private static let handGun = Weapon(
        type: "Hand Gun",
        weaponDescription: "Conventional semi-automatic pistol in a medium caliber.",
        range: 12, shots: 1, damage: 0,
        traits: [.pistol], mods: [])

    private static let handLaser = Weapon(
        type: "Hand Laser",
        weaponDescription: "Portable energy-based pistol. Popular due to ease of use and lack of recoil.",
        range: 12, shots: 1, damage: 0,
        traits: [.snapShot, .pistol], mods: [])

    private static let holdOutPistol = Weapon(
        type: "Hold Out Pistol",
        weaponDescription: "Compact pocket-pistol for personal defense.",
        range: 4, shots: 1, damage: 0,
        traits: [.pistol, .melee], mods: [])

    private static let huntingRifle = Weapon(
        type: "Hunting Rifle",
        weaponDescription: "Typical high-caliber rifle, used for hunting large, dangerous animals.",
        range: 30, shots: 1, damage: 1,
        traits: [.heavy], mods: [])

    private static let hyperBlaster = Weapon(
        type: "Hyper Blaster",
        weaponDescription: "Rapid-fire blast weapon. Most models rely on three rotating barrels to deal with heat build-up.",
        range: 24, shots: 3, damage: 1,
        traits: [], mods: [])

    private static let infantryLaser = Weapon(
        type: "Infantry Laser",
        weaponDescription: "Military energy rifle with detachable battery pack.",
        range: 30, shots: 1, damage: 0,
        traits: [.snapShot], mods: [])

    private static let machinePistol = Weapon(
        type: "Machine Pistol",
        weaponDescription: "A compact, fully automatic firearm in pistol caliber.",
        range: 8, shots: 2, damage: 0,
        traits: [.pistol, .focused], mods: [])

    private static let marksmanRifle = Weapon(
        type: "Marksman's Rifle",
        weaponDescription: "Military rifle, built for sharp shooting. Common platoon-level support weapon.",
        range: 36, shots: 1, damage: 0,
        traits: [.heavy], mods: [])

    private static let militaryRifle = Weapon(
        type: "Military Rifle",
        weaponDescription: "Conventional military automatic rifle. Caseless ammunition is typical.",
        range: 24, shots: 1, damage: 0,
        traits: [], mods: [])

    private static let needleRifle = Weapon(
        type: "Needle Rifle",
        weaponDescription: "Uses magnetism to launch a hail of razor-sharp needles at a target.",
        range: 18, shots: 2, damage: 0,
        traits: [.critical], mods: [])

    private static let plasmaRifle = Weapon(
        type: "Plasma Rifle",
        weaponDescription: "Heavy rifle firing a stream of blue-white energy bolts. Excellent all-round combat weapon, but expensive, and difficult to cool.",
        range: 20, shots: 2, damage: 1,
        traits: [.focused, .piercing], mods: [])

    private static let powerClaw = Weapon(
        type: "Power Claw",
        weaponDescription: "Heavy servo-boosted gauntlet that straps to the entire arm. Capable of punching through steel.",
        range: 0, shots: 0, damage: 3,
        traits: [.melee, .clumsy], mods: [])

    private static let rattleGun = Weapon(
        type: "Rattle Gun",
        weaponDescription: "Conventional machine gun. Most Fringe models are outdated and somewhat kit-bashed. Typically belt-fed.",
        range: 24, shots: 3, damage: 0,
        traits: [.heavy], mods: [])

    private static let ripperSword = Weapon(
        type: "Ripper Sword",
        weaponDescription: "Short, chopping blade fitted with microscopic “teeth” for ripping and tearing. Popular with K’Erin marines.",
        range: 0, shots: 0, damage: 1,
        traits: [.melee], mods: [])

    private static let scrapPistol = Weapon(
        type: "Scrap Pistol",
        weaponDescription: "A pistol pieced together from scavenged parts. Common on the frontiers.",
        range: 9, shots: 1, damage: 0,
        traits: [.pistol], mods: [])

    private static let shatterAxe = Weapon(
        type: "Shatter Axe",
        weaponDescription: "This bulky weapon discharges a blast of energy as it strikes. Originally intended for breach-and-clear operations.",
        range: 0, shots: 0, damage: 2,
        traits: [.melee], mods: [])

    private static let shellGun = Weapon(
        type: "Shell Gun",
        weaponDescription: "Stand-alone grenade launcher. Many of these are custom-built.",
        range: 30, shots: 2, damage: 0,
        traits: [.heavy, .area], mods: [])

    private static let shotgun = Weapon(
        type: "Shotgun",
        weaponDescription: "Smooth-bore weapon firing a hail of pellets. Common hunting and defensive weapon.",
        range: 12, shots: 2, damage: 1,
        traits: [.focused], mods: [])

    private static let suppressionMaul = Weapon(
        type: "Suppression Maul",
        weaponDescription: "Riot-control weapon that overloads pain receptors in most biological lifeforms.",
        range: 0, shots: 0, damage: 1,
        traits: [.melee, .impact], mods: [])

}


