//
//  ViewModifiers.swift
//  LoginLab
//
//  Created by Logan Steven Bartell on 1/5/26.
//
import Foundation
import SwiftUI

struct TextfieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundStyle(.black)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.gray)
                    .shadow(radius: 20)
            )
    }
}

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(configuration.isPressed ? Color.green.clipShape(RoundedRectangle(cornerRadius: 20)) : Color.blue.clipShape(RoundedRectangle(cornerRadius: 20)))
            .foregroundStyle(.white)
            .scaleEffect(configuration.isPressed ? 0.7 : 1)
    }
}
