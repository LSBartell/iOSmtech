//
//  FullCalendarDayView.swift
//  ClassCalendarApp
//
//  Created by Logan Steven Bartell on 11/6/25.
//

import SwiftUI

//a view used in full calendar tab to display basic info about each day, initialized with day structs from days stored in CalendarViewModel

struct FullCalendarDayView: View {
    var day: Day
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 360, height: 130)
                .foregroundStyle(.forground)
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 345, height: 115)
                .foregroundStyle(.white)
            VStack {
                Text("\(day.date.formatted(date: .numeric, time: .omitted))")
                    .font(.custom("Verdana", size: 25))
                    .foregroundStyle(.black)
                    .bold()
                    .padding(6)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.forground)
                    )
                HStack {
                    Spacer()
                        .frame(width: 35)
                    Text("Lesson: \(day.lessonName)")
                        .foregroundStyle(.black)
                    Spacer()
                    Text("ID: \(day.lessonID)")
                        .foregroundStyle(.black)
                    Spacer()
                        .frame(width: 35)
                }
                .padding(20)
                Text("Due: \(day.assignmentsDue)")
                    .font(.custom("Verdana", size: 15))
                    .foregroundStyle(.white)
                    .padding(6)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(Color.background)
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 4).foregroundStyle(.forground))
                        )
            }
        }
    }
}

