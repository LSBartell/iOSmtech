//
//  FullCalendarViewModel.swift
//  ClassCalendarApp
//
//  Created by Logan Steven Bartell on 11/6/25.
//
import Foundation
import Combine

@Observable
class CalendarViewModel {
    private(set) var days: [Day] = [] // all days fetched from network client will be stored here
    private(set) var today: Day? // set by current day when fetched
    private(set) var isLoading: Bool = false //for displaying loading on view when awaiting network call
    private(set) var errorMessage: String? // for displaying error on view when network call fails
    private var showingObjective: Bool = false
    
    private let networkClent: MocknetworkClient
    // creating and initializing instance of Network call in class
    init(networkClent: MocknetworkClient) {
        self.networkClent = networkClent
    }
    
    func fetchCalendarDays() { //used to fetch all data from mock network on NetworkClient
        Task {
            isLoading = true // set loading to true when function is called
            defer { isLoading = false } // set loading to false when task ends
            do { days = try await networkClent.fetchDays() // calls fetchdays function from network client to return array of days
                 today = try await networkClent.fetchToday()// same as above but with the current day
            } catch { errorMessage = "Failed to fetch calendar" }
        }
    }
}
