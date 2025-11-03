//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Jane Madsen on 10/30/25.
//

import Foundation
import UniformTypeIdentifiers

struct Emoji: Codable, Identifiable {
    var id: UUID = UUID()
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let archiveURL = documentsDirectory.appendingPathComponent("emojis", conformingTo: .propertyList)
    
    static let sampleEmojis = [Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness")]

    static func saveToFile(emojis: [Emoji]) {
        let encoder = PropertyListEncoder()
        let data = try? encoder.encode(emojis)
        try? data?.write(to: archiveURL)
    }
    static func loadFromFile() -> [Emoji] {
        let decoder = PropertyListDecoder()
        if let data = try? Data(contentsOf: archiveURL),
           let emojiData = try? decoder.decode([Emoji].self, from: data) {
            return emojiData
        } else {
            return sampleEmojis
        }
    }
}
