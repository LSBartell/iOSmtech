//
//  TopFiveFriendsView.swift
//  SwiftUITextLab
//
//  Created by Logan Steven Bartell on 9/23/25.
//

import SwiftUI

struct TopFiveFriendsView: View {
    var body: some View {
        Text("Top five friends")
            .font(.title)
            .underline()
        Text("1:")
        Text("Maren❤️")
            .font(.custom("Baskerville", size: 20))
            .foregroundStyle(.yellow)
        Text("2:")
        Text("Talon🤠")
            .font(.custom("Bradley Hand", size: 20))
            .foregroundStyle(.brown)
        Text("3:")
        Text("Steven🎲")
            .foregroundStyle(.blue)
        Text("4:")
        Text("Corbin🦈")
            .font(.custom("Chalkduster", size: 16))
        Text("5:")
        Text("Bryant📟")
            .font(.custom("Didot", size: 20))
            .foregroundStyle(.green)
    }
}

#Preview {
    TopFiveFriendsView()
}
