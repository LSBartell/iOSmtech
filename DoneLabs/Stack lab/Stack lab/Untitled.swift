//
//  Untitled.swift
//  Stack lab
//
//  Created by Logan Steven Bartell on 9/25/25.
//
import Foundation

struct Friend: Identifiable {
    var id = UUID()
    
    let fullName: String
    let isYourFriend: Bool
}

var myFriends: [Friend] = [Friend(fullName: "Maren Bartell", isYourFriend: true), Friend(fullName: "William Walker", isYourFriend: false), Friend(fullName: "Steven Bartell", isYourFriend: true), Friend(fullName: "Corbin Bartell", isYourFriend: true), Friend(fullName: "Elon Musk", isYourFriend: false)]


