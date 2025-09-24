//
//  MyNewModifier.swift
//  ViewModifierExamples
//
//  Created by Logan Steven Bartell on 9/24/25.
//

import SwiftUI

struct MyNewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Zapfino", size: 30))
            .padding(15)
            .foregroundStyle(.green)
            .border(.red, width: 3)
            .offset(y: 30)
    }
}

extension View {
    func myNewModifier() -> some View {
        modifier(MyNewModifier())
    }
}
