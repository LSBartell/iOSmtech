//
//  BirthdayCardView.swift
//  PickerLab
//
//  Created by Logan Steven Bartell on 1/9/26.
//

import SwiftUI

struct BirthdayCardView: View {
    let birthdayCard: BirthdayCard
    
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            VStack {
                Text("Birthday Card")
                    .underline()
                    .bold()
                    .font(.largeTitle)
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 350, height: 600)
                        .foregroundStyle(birthdayCard.backgroundColor)
                    VStack {
                        Text("Birthday Party!!!")
                            .underline()
                            .bold()
                            .font(.title)
                            .padding()
                        Text("\(birthdayCard.date.formatted(date: .numeric, time: .standard))")
                            .padding()
                            .offset(y:-35)
                        Text(birthdayCard.description)
                        
                        birthdayCard.Photo
                            .resizable()
                            .frame(width: 300, height: 350)
                        
                        Spacer()
                    }
                    .frame(width: 350, height: 600)
                }
                
                Spacer()
            }
        }
    }
}

