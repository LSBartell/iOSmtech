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
                        viewModel: CalendarViewModel(networkClent: MocknetworkClient(), displayDate: Date.now, displayDay: nil, dayOfWeek: "Today")
                    )
                    
                    FullCalendarView(
                        viewModel: CalendarViewModel(networkClent: MocknetworkClient(), displayDate: Date.now, displayDay: nil, dayOfWeek: nil)
                    )
                    
                }
            }
        }
    }
}

#Preview {
    ParentTabView()
}
