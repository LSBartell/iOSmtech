//
//  ContentView.swift
//  ClassCalendarApp
//
//  Created by Logan Steven Bartell on 11/6/25.
//

import SwiftUI

struct ParentTabView: View {
    @State private var viewModel: CalendarViewModel
    
    init() {
        _viewModel = State(wrappedValue: CalendarViewModel(networkClent: MocknetworkClient()))
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading")
                } else if let message = viewModel.errorMessage {
                    ContentUnavailableView("Could not load data", systemImage: "exclamationmark.triangle", description: Text(message))
                } else {
                    TabView {
                        TodayView(viewModel: viewModel)
                        
                        FullCalendarView()
                        
                    }
                }
            }
        }
        .task {
            viewModel.fetchCalendarDays()
        }
    }
}

#Preview {
    ParentTabView()
}
