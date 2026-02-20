//
//  USRep.swift
//  RandomAPI
//
//  Created by Logan Steven Bartell on 11/24/25.
//
import Foundation

struct USRep: Codable, Identifiable, Equatable {
    var id = UUID()
    let name: String
    let party: String
    let state: String
    let link: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case party = "party"
        case state = "state"
        case link = "link"
    }
}

struct USRepSearchResponse: Codable {
    let results: [USRep]
}

extension USRep {
    static func == (lhs: USRep, rhs: USRep) -> Bool {
        return lhs.name == rhs.name &&
               lhs.party == rhs.party &&
               lhs.state == rhs.state &&
               lhs.link == rhs.link
    }
}

