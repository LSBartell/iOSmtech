//
//  User.swift
//  InterviewChallengeOne
//
//  Created by Logan Steven Bartell on 2/24/26.
//
import Foundation
import SwiftData

@Model
class User {
    var name: String
    var isSelected = false
    var userList: UserList?
    
    
    init(name: String) {
        self.name = name
    }
}

@Model
class UserList {
    @Relationship(deleteRule: .cascade, inverse: \User.userList) var users = [User]()
    
    init(users: [User]) {
        self.users = users
    }
}
