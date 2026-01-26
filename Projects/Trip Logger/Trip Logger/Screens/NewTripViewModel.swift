//
//  NewTripViewModel.swift
//  Trip Logger
//
//  Created by Logan Steven Bartell on 1/12/26.
//
import Foundation
import SwiftUI
import MapKit
import SwiftData
import PhotosUI


@Observable
class NewTripViewModel {
    var newTripName = ""
    var disableTripNameNextButton = true
    var disablePlacePinNextButton = true
    var disableSaveButton = true
    var newTrip: Trip = Trip(name: "New Trip")
    var currentScreen = 1
    
    func nextScreen() {
        if currentScreen < 3 {
            currentScreen += 1
        }
    }
    
    func previousScreen() {
        if currentScreen > 1 {
            currentScreen -= 1
        }
    }
    
    func changeTripNameNextButton() {
        if newTripName != "" {
            disableTripNameNextButton = false
        } else {
            disableTripNameNextButton = true
        }
    }
    
    func checkIfCanSave() {
        if let journal = newTrip.journalEntries.first {
            if journal.name != "" && journal.text != "" {
                disableSaveButton = false
            } else {
                disableSaveButton = true
            }
        }
    }
    
    func addTripName() {
        newTrip.name = newTripName
    }
    
    func resetTrip() {
        newTrip = Trip(name: "New Trip")
    }
    
    func placePin(reader: MapProxy, location: CGPoint) {
        if newTrip.journalEntries.isEmpty {
            if let coordinate = reader.convert(location, from: .local) {
                let newJournalEntry: JournalEntry = JournalEntry(location: Location(latitude: coordinate.latitude, longitude: coordinate.longitude))
                newTrip.journalEntries.append(newJournalEntry)
                
                disablePlacePinNextButton = false
            }
        }
    }
}
