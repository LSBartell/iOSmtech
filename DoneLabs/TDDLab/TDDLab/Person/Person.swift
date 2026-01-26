//
//  Person.swift
//  TDDLab
//
//  Created by Logan Steven Bartell on 1/23/26.
//

import Foundation

struct Person {
    let firstName: String
    let lastName: String
    let age: Int
    let legalDrivingAge = 16
    
    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    var fullName: String {
        return firstName + " " + lastName
    }
    
    func callAge() -> Int {
        age
    }
    
    func canDrive() -> Bool {
        if age > legalDrivingAge {
           return true
        } else {
            return false
        }
    }
}
