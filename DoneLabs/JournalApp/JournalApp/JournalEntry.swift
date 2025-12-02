//
//  JournalEntry.swift
//  JournalApp
//
//  Created by Logan Steven Bartell on 12/2/25.
//
import Foundation
import SwiftData

@Model
class JournalEntry {
    var title: String
    var body: String
    var date: Date
    
    init(title: String, body: String, date: Date) {
        self.title = title
        self.body = body
        self.date = date
    }
}
