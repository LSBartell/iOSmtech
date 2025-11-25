//
//  ContentView.swift
//  ClassCalendarApp
//
//  Created by Logan Steven Bartell on 11/6/25.
//

import SwiftUI

struct ParentTabView: View {
    var body: some View {
        NavigationStack {
            Group {
                
                TabView {
                    DayView(
                        viewModel: CalendarViewModel(networkClent: MocknetworkClient(), displayDate: Date.now, displayDay: nil, dayOfWeek: "Today") // makes sure the day showing is set to Today, see CalendarViewModel line 52
                    )
                    .tabItem {
                        Image(systemName: "ellipsis.calendar")
                    }
                    
                    FullCalendarView(
                        viewModel: CalendarViewModel(networkClent: MocknetworkClient(), displayDate: Date.now, displayDay: nil, dayOfWeek: nil)
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

#Preview {
    ParentTabView()
}
