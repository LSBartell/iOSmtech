//
//  Assignment.swift
//  ClassCalendarApp
//
//  Created by Logan Steven Bartell on 2/4/26.
//
import Foundation

struct Assignment: Identifiable, Codable, Hashable {
    var id = UUID()
    
    let name: String?
    let assignmentType: String?
    let assignedOn: Date?
    let dueOn: Date?
    let progress: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case assignmentType
        case assignedOn
        case dueOn
        case progress = "userProgress"
    }
}
