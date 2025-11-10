//
//  ContentView.swift
//  ClassCalendarApp
//
//  Created by Logan Steven Bartell on 11/6/25.
//

import SwiftUI

struct ParentTabView: View {
    var body: some View {
        TabView {
            TodayView()
            
            FullCalendarView()
            
        }
    }
}

#Preview {
    ParentTabView()
}
