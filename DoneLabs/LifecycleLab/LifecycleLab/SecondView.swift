//
//  SecondView.swift
//  LifecycleLab
//
//  Created by Logan Steven Bartell on 10/21/25.
//

import SwiftUI

struct SecondView: View {
    @Binding var events: String
    var body: some View {
        Text(events)
            .onAppear {
                events.append("Second View Appear. ")
            }
            .onDisappear {
                events.append("Second View Disappear. ")
            }
    }
}

