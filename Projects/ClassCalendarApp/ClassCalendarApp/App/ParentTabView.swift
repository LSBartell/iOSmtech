//
//  ContentView.swift
//  ClassCalendarApp
//
//  Created by Logan Steven Bartell on 11/6/25.
//

import SwiftUI

struct ParentTabView: View {
    var user: User
    
    var body: some View {
        Group {
            NavigationStack {
                TabView {
                    DayView(
                        viewModel: CalendarViewModel(networkClent: MocknetworkClient(), displayDate: Date.now, displayDay: nil, dayOfWeek: "Today", user: user) // makes sure the day showing is set to Today, see CalendarViewModel line 52
                    )
                    .tabItem {
                        Image(systemName: "ellipsis.calendar")
                    }
                    
                    FullCalendarView(
                        viewModel: CalendarViewModel(networkClent: MocknetworkClient(), displayDate: Date.now, displayDay: nil, dayOfWeek: nil, user: user)
                    )
                    .tabItem {
                        Image(systemName: "calendar")
                    }
                    
                }
                .tint(.forground)
            }
        }
    }
}

