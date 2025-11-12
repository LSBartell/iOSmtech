//
//  FullCalendarDayView.swift
//  ClassCalendarApp
//
//  Created by Logan Steven Bartell on 11/6/25.
//

import SwiftUI

struct FullCalendarDayView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 360, height: 130)
                .foregroundStyle(.forground)
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 345, height: 115)
                .foregroundStyle(.white)
            VStack {
                Text("Monday: 11/11/25")
                    .font(.custom("Verdana", size: 25))
                    .bold()
                    .padding(6)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.forground)
                    )
                HStack {
                    Spacer()
                        .frame(width: 35)
                    Text("Lesson: Learn to code")
                    Spacer()
                    Text("ID: TP01")
                    Spacer()
                        .frame(width: 35)
                }
                .padding(20)
                Text("Due: Nothing")
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

#Preview {
    FullCalendarDayView()
}
