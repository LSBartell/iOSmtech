//
//  Species.swift
//  5Parsecs
//
//  Created by Logan Steven Bartell on 2/13/26.
//

import Foundation

enum SpeciesType {
    case human, bot, engineer, kErin, soulless, precurser, feral, swift, deConverted, unityAgent, mysteriousPast, hakshan, stalker, hulker, hopefulRookie, geneticUplift, mutant, assaultBot, manipulator, primitive, feeler, emoSuppressed, minorAlien, traveler, empath, bioUpgrade
}

struct Species {
    let name: String
    let description: String
    let abilites: [String]
}
