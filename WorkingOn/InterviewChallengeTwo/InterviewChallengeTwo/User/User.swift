//
//  User.swift
//  InterviewChallengeTwo
//
//  Created by Logan Steven Bartell on 2/25/26.
//
import Foundation

struct UsersResults: Codable, Identifiable {
    var id = UUID()
    let users: [User]
    
    enum CodingKeys: String, CodingKey {
        case users = "results"
    }
}

struct User: Codable, Identifiable {
    var id = UUID()
    let name: UserName
    let imageUrls: UserPicture
    let gender: String
    let email: String
    let dob: UserAge
    var age: Int {
        dob.age
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageUrls = "picture"
        case gender
        case email
        case dob
        
    }
    
}

struct UserName: Codable, Identifiable {
    var id = UUID()
    var firstName: String
    var lastName: String
    var title: String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first"
        case lastName = "last"
        case title = "title"
    }
}

struct UserPicture: Codable {
    let large: String
    let medium: String
    let thumbnail: String
    
    enum CodingKeys: String, CodingKey {
        case large
        case medium
        case thumbnail
    }
}

struct UserAge: Codable {
    let age: Int
    
    enum CodingKeys: String, CodingKey {
        case age
    }
}
