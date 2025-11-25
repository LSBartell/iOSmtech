//
//  DogItem.swift
//  RandomAPI
//
//  Created by Logan Steven Bartell on 11/21/25.
//
import Foundation

struct Dog: Codable, Identifiable {
    var id = UUID()
    var name: String = ""
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "message"
    }
}
