//
//  ButtonViewModifier.swift
//  ClassCalendarApp
//
//  Created by Logan Steven Bartell on 11/10/25.
//

import SwiftUI
//simple view modifier for yellow red and black bordered buttons
struct ButtonViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Verdana", size: 22))
            .bold()
            .foregroundStyle(Color.background)
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(Color.forground)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 2).foregroundStyle(.black))
            )
    }
}
