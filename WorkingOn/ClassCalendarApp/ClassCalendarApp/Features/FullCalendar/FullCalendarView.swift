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
            Group {
                if viewModel.isLoading {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 100, height: 100)
                            .foregroundStyle(.white)
                        ProgressView("Loading")
                    }
                } else if let message = viewModel.errorMessage {
                    ContentUnavailableView("Could not Load", systemImage: "exclamationmark.triangle", description: Text(message))
                } else {
                    ScrollView {
                    LazyVStack {
                    ForEach($viewModel.days) { $day in
                            NavigationLink {
                                DayView(viewModel: CalendarViewModel(networkClent: MocknetworkClient(), displayDate: day.date, displayDay: day, dayOfWeek: ""))
                            } label: {
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
                                            Text("ID: TP01")
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

