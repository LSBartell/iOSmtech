//
//  StoreItem.swift
//  iTunesSearch
//
//  Created by Logan Steven Bartell on 11/14/25.
//
import Foundation

struct StoreItem: Codable, Hashable {
    let artist: String
    let songTitle: String
    let collectionTitle: String
    let trackPrice: Double
    let artwork: String?
    var previewUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case artist = "artistName"
        case songTitle = "trackName"
        case collectionTitle = "collectionName"
        case trackPrice
        case artwork = "artworkUrl100"
        case previewUrl = "previewUrl"
    }
}

struct SearchResponse: Codable {
    let results: [StoreItem]
}
