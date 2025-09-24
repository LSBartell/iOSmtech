//
//  BlogPostView.swift
//  SwiftUITextLab
//
//  Created by Logan Steven Bartell on 9/23/25.
//

import SwiftUI

struct BlogPostView: View {
    var body: some View {
        Text("My Vacation")
            .font(.title)
            .underline(pattern: .dash)
        Text("9/23/25")
            .font(.custom("Courier New", size: 12))
        Text("I have not been on any sort of vacation in 4 years. I dont have the free time so i just work and play at home, it is what it is i guess.")
            .foregroundStyle(.indigo)
        Text("Likes: 6")
            .font(.custom("Copperplate", size: 20))
            .foregroundStyle(.green)
        Text("Comments")
            .font(.title3)
            .underline()
        Text("Aw man that sucks - Talon")
            .font(.caption)
        Text("Lets go on one! - Maren")
            .font(.caption)
    }
}

#Preview {
    BlogPostView()
}
