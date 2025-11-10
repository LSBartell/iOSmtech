//
//  TodayView.swift
//  ClassCalendarApp
//
//  Created by Logan Steven Bartell on 11/6/25.
//

import SwiftUI

struct TodayView: View {
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
                        Text("Today")
                            .font(.custom("Verdana", size: 30))
                            .bold()
                            .underline()
                        HStack {
                            Text("Date: 11/15/2025")
                                .padding(.horizontal, 25)
                            Spacer()
                            Text("LessonID: TP01")
                                .padding(.horizontal, 25)
                        }
                        Text("Lesson Name")
                            .bold()
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 350, height: 5)
                        HStack {
                            
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    TodayView()
}
