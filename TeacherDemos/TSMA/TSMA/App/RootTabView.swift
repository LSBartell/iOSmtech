//
//  ContentView.swift
//  TSMA
//
//  Created by Nathan Lambson on 11/5/25.
//

import SwiftUI

struct RootTabView: View {
    @Environment(AppServices.self) private var appServices
    
    var body: some View {
        TabView {
            PostsView(networkClient: appServices.networkClient)
                .tabItem {
                    Label("Posts", systemImage: "rectangle.stack.person.crop")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
    }
}
