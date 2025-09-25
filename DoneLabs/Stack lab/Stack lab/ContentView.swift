//
//  ContentView.swift
//  Stack lab
//
//  Created by Logan Steven Bartell on 9/25/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerSize: .init(width: 20, height: 20))
                .fill(.gray)
            VStack() {
                RoundedRectangle(cornerSize: .init(width: 20, height: 20))
                    .fill(.cyan)
                    .frame(width: 375, height: 150)
                    .padding(15)
                RoundedRectangle(cornerSize: .init(width: 20, height: 20))
                    .fill(.white)
                    .frame(width: 375, height: 570)
            }
            VStack() {
                HStack(alignment: .top) {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 75, height: 75)
                    Text("Logan B.")
                        .bold()
                        .font(.custom("Arial", size: 30))
                    Spacer()
                }
                .padding(30)
                ZStack(alignment: .top) {
                    RoundedRectangle(cornerSize: .init(width: 20, height: 20))
                        .fill(.white)
                        .frame(width: 200, height: 40)
                    HStack(alignment: .center) {
                        Image(systemName: "person.2.badge.plus.fill")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundStyle(.green)
                        Text("add Friend")
                            .foregroundStyle(.green)
                            
                            
                    }
                    .padding(5)
                }
                .offset(y: -28)
                Text("Friends")
                    .font(.title)
                    .underline()
                
                RoundedRectangle(cornerSize: .init(width: 5, height: 5))
                    .frame(width: 335, height: 1)
                    .foregroundStyle(.gray)
                
                ForEach(myFriends) { friend in
                    HStack(alignment: .center) {
                        if friend.isYourFriend {
                            Spacer()
                                .frame(width: 20)
                            Image(systemName: "person.crop.circle.badge.minus")
                                .foregroundStyle(.red)
                            Text(friend.fullName)
                            Spacer()
                        } else {
                            Spacer()
                                .frame(width: 20)
                            Image(systemName: "person.crop.circle.badge.plus")
                                .foregroundStyle(.green)
                            Text(friend.fullName)
                            Spacer()
                        }
                    }
                    RoundedRectangle(cornerSize: .init(width: 5, height: 5))
                        .frame(width: 335, height: 1)
                        .foregroundStyle(.gray)
                }
                ZStack() {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 300, height: 30)
                        .foregroundStyle(.cyan)
                    HStack() {
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 50, height: 8)
                        ForEach(1..<4) {_ in
                            RoundedRectangle(cornerRadius: 30)
                                .frame(width: 40, height: 5)
                                .foregroundStyle(.gray)
                        }
                    }
                }
                Text("Profile")
                    .font(.largeTitle)
                    .underline()
                    .padding(25)
            }
        }
    }
}

#Preview {
    ContentView()
}
