//
//  textListView.swift
//  SwiftUiIntro
//
//  Created by Logan Steven Bartell on 9/23/25.
//

import SwiftUI

struct textListView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Text("Hello, world!")
            .font(.largeTitle)
            .italic()
        Text("my text")
            .font(.custom("Zapfino", size: 50))
            .foregroundStyle(.green)
    }
    }

#Preview {
    textListView()
}
