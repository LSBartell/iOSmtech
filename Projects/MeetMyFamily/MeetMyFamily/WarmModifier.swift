//
//  WarmModifier.swift
//  MeetMyFamily
//
//  Created by Logan Steven Bartell on 10/10/25.
//

import SwiftUI

struct WarmModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(Color.warmAccent)
            )
    }
}

