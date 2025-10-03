//
//  Untitled.swift
//  Hotel Registration App
//
//  Created by Logan Steven Bartell on 10/3/25.
//
import SwiftUI

struct seperatorModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 350, height: 4)
            .foregroundStyle(Color.background)
            .padding()
    }
}

