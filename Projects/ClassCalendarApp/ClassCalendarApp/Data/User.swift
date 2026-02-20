//
//  User.swift
//  ClassCalendarApp
//
//  Created by Logan Steven Bartell on 1/29/26.
//
import Foundation

struct User: Codable, Hashable {
    var userName: String
    var userId: String
    var secret: String
    
    enum CodingKeys: String, CodingKey {
        case userName
        case userId = "userUUID"
        case secret
    }
}
