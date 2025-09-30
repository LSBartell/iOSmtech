//
//  Untitled.swift
//  button
//
//  Created by Logan Steven Bartell on 9/29/25.
//
import SwiftUI

struct GradiantButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .font(.custom("Copperplate", size: 30))
            .foregroundStyle(Gradient(colors: [.red, .yellow]))
    }
}
