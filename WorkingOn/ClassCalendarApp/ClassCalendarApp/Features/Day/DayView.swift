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
                    Group {
                        if viewModel.isLoading {
                            ProgressView("Loading")
                        } else if let message = viewModel.errorMessage {
                            ContentUnavailableView("Could not Load", systemImage: "exclamationmark.triangle", description: Text(message))
                        } else {
                            VStack {
                                Text("\(viewModel.dayOfWeek ?? "")") // to be set by ViewModel
                                    .font(.custom("Verdana", size: 30))
                                    .bold()
                                    .underline()
                                HStack {
                                    Text("Date: \(viewModel.displayDay?.date.formatted(date: .numeric, time: .omitted) ?? "")") // to be set by ViewModel
                                        .padding(.horizontal, 25)
                                    Spacer()
                                    Text("Lesson ID: \(viewModel.displayDay?.lessonID ?? "")")// to be set
                                        .padding(.horizontal, 25)
                                }
                                Text(viewModel.displayDay?.lessonName ?? "")// to be set
                                    .bold()
                                RoundedRectangle(cornerRadius: 30)
                                    .frame(width: 350, height: 5)
                                Spacer()
                                    .frame(height: 20)
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
                        InfoSheet(infoString: viewModel.displayDay?.mainObjective ?? "")
                    }
                    .sheet(isPresented: $viewModel.showingReadingDue) {
                        InfoSheet(infoString: viewModel.displayDay?.readingDue ?? "")
                    }
                    .sheet(isPresented: $viewModel.showingAssignmentsDue) {
                        InfoSheet(infoString: viewModel.displayDay?.assignmentsDue ?? "")
                    }
                    .sheet(isPresented: $viewModel.showingNewAssignments) {
                        InfoSheet(infoString: viewModel.displayDay?.newAssignments ?? "")
                    }
                    .sheet(isPresented: $viewModel.showingDailyCodeChallenge) {
                        InfoSheet(infoString: viewModel.displayDay?.daiyCodeChallenge ?? "")
                    }
                    .sheet(isPresented: $viewModel.showingWordOfTheDay) {
                        InfoSheet(infoString: viewModel.displayDay?.wordOfTheDay ?? "")
                    }
                }
                .task {
                    viewModel.fetchDay()
                }
            }
        }
    }
}
