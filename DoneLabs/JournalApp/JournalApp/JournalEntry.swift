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
    var journal: Journal?
    
    init(title: String, body: String, date: Date, journal: Journal?) {
        self.title = title
        self.body = body
        self.date = date
        self.journal = journal
    }
}

@Model
class Journal {
    var title: String
    var date: Date
    @Relationship(deleteRule: .cascade, inverse: \JournalEntry.journal) var entries = [JournalEntry]()
    
    init(title: String, date: Date, entries: [JournalEntry]) {
        self.title = title
        self.date = date
        self.entries = entries
    }
}
