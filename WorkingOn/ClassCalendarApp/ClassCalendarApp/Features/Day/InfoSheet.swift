//
//  ObjectiveView.swift
//  ClassCalendarApp
//
//  Created by Logan Steven Bartell on 11/10/25.
//

import SwiftUI
//view for displaying more detailed info on each sheet, used by buttons on DayView
struct InfoSheet: View {
    var infoString: String
    var body: some View {
        Text("\(infoString)")
    }
}

