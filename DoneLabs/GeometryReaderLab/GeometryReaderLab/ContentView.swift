//
//  ContentView.swift
//  GeometryReaderLab
//
//  Created by Logan Steven Bartell on 1/6/26.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var columnCount: Int {
        if horizontalSizeClass == .regular {
            return 3
        } else {
            return 2
        }
    }
    
    var rowCount: Int {
        return (Profile.list.count + columnCount - 1) / columnCount
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .center) {
                    ForEach(0..<rowCount, id: \.self) { row in
                        HStack {
                            Spacer()
                            ForEach(0..<columnCount, id: \.self) { column in
                                let profileIndex = row * columnCount + column
                                if horizontalSizeClass == .compact {
                                    if profileIndex < Profile.list.count {
                                        cardView(profile: Profile.list[profileIndex], length: geometry.size.width / 2.2)
                                    } else {
                                        Spacer()
                                            .frame(width: geometry.size.width / 2.15)
                                    }
                                } else {
                                    if profileIndex < Profile.list.count {
                                        cardView(profile: Profile.list[profileIndex], length: geometry.size.width / 3.3)
                                    } else {
                                        Spacer()
                                            .frame(width: geometry.size.width / 3.22)
                                    }
                                }
                            }
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

func cardView(profile: Profile, length: CGFloat) -> some View {
    ZStack {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: length, height: length)
            .foregroundStyle(.blue)
        VStack {
            Text(profile.name)
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: length / 2, height: length / 2)
            Text(profile.description)
        }
        
    }
}

#Preview {
    ContentView()
}
