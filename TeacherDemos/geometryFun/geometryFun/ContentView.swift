    //
//  ContentView.swift
//  geometryFun
//
//  Created by Logan Steven Bartell on 1/6/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Spacer()
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: geometry.size.width / 2)
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
