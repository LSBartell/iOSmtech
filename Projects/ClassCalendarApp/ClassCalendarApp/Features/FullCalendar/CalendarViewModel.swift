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
    var user: User
    
    var days: [Day] = [] // all days fetched from network client will be stored here
    private(set) var displayDay: Day? // set by current day when fetched
    private(set) var isLoading: Bool = false //for displaying loading on view when awaiting network call
    private(set) var errorMessage: String? // for displaying error on view when network call fails
    
    var displayDate: Date // for use in the fetchDay function for Today tab
    // bools for showing the infoSheet for each subject, used in DayView buttons
    var showingObjective: Bool = false
    var showingReadingDue: Bool = false
    var showingAssignmentsDue: Bool = false
    var showingNewAssignments:Bool = false
    var showingDailyCodeChallenge: Bool = false
    var showingWordOfTheDay:Bool = false
    //for showing day of week, used to determine if the day to display is today rather than a weekday
    var dayOfWeek: String?
    
    let dateFormatter = DateFormatter()//for getting the day of the week
    
    private let apiController = APIController()
    
    private let mockNetworkClent: MocknetworkClient
    // creating and initializing instance of Network call in class
    init(networkClent: MocknetworkClient, displayDate: Date, displayDay: Day?, dayOfWeek: String?, user: User) {
        self.mockNetworkClent = networkClent
        self.displayDate = displayDate
        self.displayDay = displayDay
        self.dayOfWeek = dayOfWeek
        self.user = user
    }
    
    func fetchCalendarDays() { //used to fetch all data from mock network on NetworkClient
        Task {
            isLoading = true // set loading to true when function is called
            defer { isLoading = false } // set loading to false when task ends
            do {
                days = try await apiController.fetchAllDays(secret: user.secret) // calls fetchdays function from network client to return array of days
            } catch {
                print(error)
                errorMessage = "Failed to load calendar"
            }
        }
    }
    
    func fetchDay() {
        Task {
            isLoading = true
            defer { isLoading = false }
            do {
                if dayOfWeek == "Today" {
//                    print(user.secret)
                    displayDay = try await apiController.fetchToday(secret: user.secret)
//                    print("\(displayDay, default: "no entry")")
                } else {
                    displayDay = try await apiController.fetchDayDate(secret: user.secret, date: (displayDay?.date.formatted(date: .numeric, time: .omitted))!)
//                    print(displayDay?.assignmentsDue)
//                    print(displayDay?.newAssignments)
                }
            } catch { errorMessage = "Failed to load date" }
        }
    }
}
