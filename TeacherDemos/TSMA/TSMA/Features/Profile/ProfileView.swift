//
//  ProfileView.swift
//  TSMA
//
//  Created by Nathan Lambson on 11/5/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                ContentUnavailableView("Profile coming soon", systemImage: "person.crop.circle.badge.questionmark", description: Text("Stub view for user profile"))
                
                Button("Edit Profile") { }
                
                Button("New Post") { }
            }
            .padding()
            .navigationTitle("Profile")
        }
    }
}
