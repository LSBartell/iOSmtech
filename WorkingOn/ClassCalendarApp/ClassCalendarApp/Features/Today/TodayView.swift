//
//  TodayView.swift
//  ClassCalendarApp
//
//  Created by Logan Steven Bartell on 11/6/25.
//

import SwiftUI

struct TodayView: View {
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
                        VStack {
                            Text("Today") // to be set by ViewModel
                                .font(.custom("Verdana", size: 30))
                                .bold()
                                .underline()
                            HStack {
                                Text("Date: 11/15/2025") // to be set by ViewModel
                                    .padding(.horizontal, 25)
                                Spacer()
                                Text("LessonID: TP01")// to be set
                                    .padding(.horizontal, 25)
                            }
                            Text("Lesson Name")// to be set
                                .bold()
                            RoundedRectangle(cornerRadius: 30)
                                .frame(width: 350, height: 5)
                            Spacer()
                                .frame(height: 20)
                            Button(action: {}) {
                                    Text("Objectives")
                                    .modifier(ButtonViewModifier())
                                }
                            Spacer()
                                .frame(height: 20)
                            Button(action: {}) {
                                    Text("Reading Due")
                                        .modifier(ButtonViewModifier())
                                }
                            Spacer()
                                .frame(height: 20)
                            Button(action: {}) {
                                    Text("Assignments Due")
                                    .modifier(ButtonViewModifier())
                                }
                            Spacer()
                                .frame(height: 20)
                            Button(action: {}) {
                                Text("New Assignments")
                                    .modifier(ButtonViewModifier())
                                }
                            Spacer()
                                .frame(height: 20)
                            Button(action: {}) {
                                Text("Daily Code Challenge")
                                    .modifier(ButtonViewModifier())
                            }
                            Spacer()
                                .frame(height: 20)
                            Button(action: {}) {
                                Text("Word Of The Day")
                                    .modifier(ButtonViewModifier())
                            }
                            Spacer()
                        }
                    }
                }
            }
            .sheet(isPresented: $showingObjectives) {
                ObjectiveSheet()
        }
    }
}

#Preview {
    TodayView()
}
