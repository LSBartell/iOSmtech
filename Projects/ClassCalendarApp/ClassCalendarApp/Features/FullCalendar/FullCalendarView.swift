//
//  FullCalendarView.swift
//  ClassCalendarApp
//
//  Created by Logan Steven Bartell on 11/6/25.
//

import SwiftUI

struct FullCalendarView: View {
    @State var viewModel: CalendarViewModel
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            Group { // for showing loading animation if isLoading true
                if viewModel.isLoading { // set to true while loading by fecthCalendarDays()
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 100, height: 100)
                            .foregroundStyle(.white)
                        ProgressView("Loading")
                    }
                } else if let message = viewModel.errorMessage {
                    ContentUnavailableView("Could not Load", systemImage: "exclamationmark.triangle", description: Text(message))
                } else {
                    ScrollView { //if loads the calendar data, shows a scroll view of navigation link buttons with basic day info for each day
                        LazyVStack {
                            ForEach($viewModel.days) { $day in
                                if day.date > Date.init(timeIntervalSinceNow: -604800) && day.date < Date.init(timeIntervalSinceNow: 1209600) {
                                NavigationLink {
                                        DayView(viewModel: CalendarViewModel(networkClent: MocknetworkClient(), displayDate: day.date, displayDay: day, dayOfWeek: String(viewModel.dateFormatter.weekdaySymbols[Calendar.current.component(.weekday, from: day.date) - 1]), user: viewModel.user))// brings up detailed view of selected day, formatter used to get day of week from the day.date
                                    } label: {
                                        FullCalendarDayView(day: day)
                                    }
                                }
                            }
                        
                    }
                    }
                    
                }
            }
        }
        .task {
            viewModel.fetchCalendarDays()
        }
    }
}

