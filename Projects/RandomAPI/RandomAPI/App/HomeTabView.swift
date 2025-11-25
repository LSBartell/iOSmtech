//
//  ContentView.swift
//  RandomAPI
//
//  Created by Logan Steven Bartell on 11/21/25.
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        TabView {
            Tab("", systemImage: "dog") {
                DogView()
            }
            Tab("", systemImage: "person") {
                USRepView()
            }
        }
    }
}

#Preview {
    HomeTabView()
}
