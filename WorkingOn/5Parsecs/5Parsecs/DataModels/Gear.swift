//
//  Gear.swift
//  5Parsecs
//
//  Created by Logan Steven Bartell on 2/13/26.
//
import Foundation
import SwiftData

@Model
class Gear {
    var name: String
    var type: [GearType]
    var effect: String
    
    init(name: String, type: [GearType], effect: String) {
        self.name = name
        self.type = type
        self.effect = effect
    }
}
