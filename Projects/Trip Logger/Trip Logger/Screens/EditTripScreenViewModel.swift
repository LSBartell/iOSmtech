//
//  EditTripScreenViewModel.swift
//  Trip Logger
//
//  Created by Logan Steven Bartell on 1/16/26.
//
import Foundation
import SwiftUI
import SwiftData
import MapKit

@Observable
class EditTripScreenViewModel {
    enum NewPinScreens {
        case addPin
        case editPin
    }
    
    var trip: Trip
    var newEntry: JournalEntry?
    var newEntryName = ""
    var newEntryText = ""
    var displayPinScreen: NewPinScreens = .addPin
    
    
    init(trip: Trip) {
        self.trip = trip
    }
    
    func placePin(reader: MapProxy, location: CGPoint) {
        if newEntry == nil {
            if let coordinate = reader.convert(location, from: .local) {
                let newJournalEntry: JournalEntry = JournalEntry(location: Location(latitude: coordinate.latitude, longitude: coordinate.longitude))
                newEntry = newJournalEntry
            }
        }
    }
    
    func updateNewEntry() {
        if newEntry != nil {
            newEntry!.name = newEntryName
            newEntry!.text = newEntryText
        }
    }
    
    func saveNewEntry() {
        if newEntry != nil {
            trip.journalEntries.append(newEntry!)
        }
    }
    
    func changeScreen(viewModel: EditTripScreenViewModel) {
        if displayPinScreen == .addPin {
            displayPinScreen = .editPin
        } else {
            displayPinScreen = .addPin
        }
    }
    
    func delete(_ offsets: IndexSet) {
        for index in offsets {
            trip.journalEntries.remove(at: index)
        }
    }
}
