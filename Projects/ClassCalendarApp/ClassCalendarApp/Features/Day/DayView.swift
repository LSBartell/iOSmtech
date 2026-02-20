//
//  TodayView.swift
//  ClassCalendarApp
//
//  Created by Logan Steven Bartell on 11/6/25.
//

import SwiftUI

struct DayView: View {
    @State var viewModel: CalendarViewModel
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            VStack {
                HStack(alignment: .top) {
                    Image("MtechLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .background {
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundStyle(.white)
                        }
                        .scenePadding(.leading)
                    Text("iOS Calendar")
                        .font(
                            .custom("Verdana", size: 30)
                            .bold()
                        )
                        .foregroundStyle(.white)
                    Spacer()
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .scenePadding(.horizontal)
                        .foregroundStyle(.white)
                    Group { //for loading animation
                        if viewModel.isLoading { // set by calling fetchDay at bottom of view, only used by today page as the full calendar pages already have their data from full calendar tab
                            ProgressView("Loading")
                        } else if let message = viewModel.errorMessage { //error if cannot load from network
                            ContentUnavailableView("Could not Load", systemImage: "exclamationmark.triangle", description: Text(message))
                        } else {//shows the main view if everything loads
                            VStack {
                                Text("\(viewModel.dayOfWeek ?? "")") // to be set by ViewModel
                                    .font(.custom("Verdana", size: 30))
                                    .bold()
                                    .underline()
                                HStack {
                                    Text("Date: \(viewModel.displayDay?.date.formatted(date: .numeric, time: .omitted) ?? "")") // date formatted to show numeric date
                                        .padding(.horizontal, 25)
                                    Spacer()
                                    Text("Lesson ID: \(viewModel.displayDay?.lessonID ?? "No ID")")
                                        .padding(.horizontal, 25)
                                }
                                Text(viewModel.displayDay?.lessonName ?? "No Name")// to be set
                                    .bold()
                                RoundedRectangle(cornerRadius: 30)
                                    .frame(width: 350, height: 5)
                                Spacer()
                                    .frame(height: 20)
                                //buttons for all of the sheets
                                Button(action: { viewModel.showingObjective = true }) {
                                    Text("Objectives")
                                        .modifier(ButtonViewModifier())
                                }
                                Spacer()
                                    .frame(height: 20)
                                Button(action: { viewModel.showingReadingDue = true }) {
                                    Text("Reading Due")
                                        .modifier(ButtonViewModifier())
                                }
                                Spacer()
                                    .frame(height: 20)
                                Button(action: { viewModel.showingAssignmentsDue = true }) {
                                    Text("Assignments Due")
                                        .modifier(ButtonViewModifier())
                                }
                                Spacer()
                                    .frame(height: 20)
                                Button(action: { viewModel.showingNewAssignments = true }) {
                                    Text("New Assignments")
                                        .modifier(ButtonViewModifier())
                                }
                                Spacer()
                                    .frame(height: 20)
                                Button(action: { viewModel.showingDailyCodeChallenge = true }) {
                                    Text("Daily Code Challenge")
                                        .modifier(ButtonViewModifier())
                                }
                                Spacer()
                                    .frame(height: 20)
                                Button(action: { viewModel.showingWordOfTheDay = true }) {
                                    Text("Word Of The Day")
                                        .modifier(ButtonViewModifier())
                                }
                                Spacer()
                            }
                        }
                    }
                    .sheet(isPresented: $viewModel.showingObjective) {
                        if viewModel.displayDay?.mainObjective != "" {
                            InfoSheet(infoString: viewModel.displayDay?.mainObjective ?? "No Objectives Today")
                        } else {
                            InfoSheet(infoString: "No Objectives Today")
                        }
                    }
                    .sheet(isPresented: $viewModel.showingReadingDue) {
                        if viewModel.displayDay?.readingDue != "" {
                            InfoSheet(infoString: viewModel.displayDay?.readingDue ?? "No Reading Due")
                        } else {
                            InfoSheet(infoString: "No Reading Due")
                        }
                    }
                    .sheet(isPresented: $viewModel.showingAssignmentsDue) {
                        AssignmentSheet(assignments: viewModel.displayDay?.assignmentsDue ?? [])
                    }
                    .sheet(isPresented: $viewModel.showingNewAssignments) {
                        AssignmentSheet(assignments: viewModel.displayDay?.newAssignments ?? [])
                    }
                    .sheet(isPresented: $viewModel.showingDailyCodeChallenge) {
                        if viewModel.displayDay?.dailyCodeChallenge != "" {
                            InfoSheet(infoString: viewModel.displayDay?.dailyCodeChallenge ?? "No Daily Code Challenge")
                        } else {
                            InfoSheet(infoString: "No Daily Code Challenge")
                        }
                    }
                    .sheet(isPresented: $viewModel.showingWordOfTheDay) {
                        if viewModel.displayDay?.wordOfTheDay != "" {
                            InfoSheet(infoString: viewModel.displayDay?.wordOfTheDay ?? "No Word Of The Day")
                        } else {
                            InfoSheet(infoString: "No Word Of The Day")
                        }
                    }
                }
                .task {
                    viewModel.fetchDay() // called to load current day on today tab
                }
            }
        }
    }
}
