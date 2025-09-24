//
//  MyModifier.swift
//  ViewModifierExamples
//
//  Created by Toby Youngberg on 9/15/25.
//

import SwiftUI

struct MyModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .bold()
            .italic()
            .strikethrough()
            .underline()
    }
}

extension View {
    func myModifier() -> some View {
        modifier(MyModifier())
    }
}
