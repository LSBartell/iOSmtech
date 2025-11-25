//
//  USRep.swift
//  RandomAPI
//
//  Created by Logan Steven Bartell on 11/24/25.
//
import Foundation

struct USRep: Codable, Identifiable {
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

