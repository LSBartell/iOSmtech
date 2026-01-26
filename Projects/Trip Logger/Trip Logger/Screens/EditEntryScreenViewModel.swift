//
//  EditEntryScreenViewModel.swift
//  Trip Logger
//
//  Created by Logan Steven Bartell on 1/19/26.
//
import Foundation
import SwiftUI
import SwiftData
import MapKit

@Observable
class EditEntryScreenViewModel {
    var entry: JournalEntry
    
    init(entry: JournalEntry) {
        self.entry = entry
    }
    
}
