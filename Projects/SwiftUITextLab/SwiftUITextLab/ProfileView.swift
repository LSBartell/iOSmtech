//
//  ProfileView.swift
//  SwiftUITextLab
//
//  Created by Logan Steven Bartell on 9/23/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        Text("UserName: Inaimus")
            .font(.custom("Tahoma", size: 30))
        Text("Logan Bartell")
            .font(.custom("Skia", size: 22))
            .foregroundStyle(.red)
        Text("Eagle Mountain, UT")
            .font(.custom("SignPainter", size: 15))
        Text("Bio:")
            .font(.title3)
        Text("I like tabletop games, making barbecue, and hanging with my wife.")
            .font(.custom("SnellRoundhand", size: 20))
            .foregroundStyle(.cyan)
    }
}

#Preview {
    ProfileView()
}
