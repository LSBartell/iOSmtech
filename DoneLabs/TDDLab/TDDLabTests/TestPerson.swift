//
//  TestPerson.swift
//  TDDLab
//
//  Created by Logan Steven Bartell on 1/23/26.
//
import XCTest
@testable import TDDLab

class TestPerson: XCTestCase {
    
    func testFullName() {
        let person = Person(firstName: "John", lastName: "Doe", age: 20)
        
        XCTAssertEqual(person.fullName, "John Doe")
    }
    
    func testAgeFunc() {
        let person = Person(firstName: "John", lastName: "Doe", age: 20)
        var personHasAge = false
        
        if person.callAge() > 0 {
            personHasAge = true
        }
        
        XCTAssert(personHasAge)
    }
    
    func testCanDrive() {
        let person = Person(firstName: "John", lastName: "Doe", age: 20)
        var canDrive = false
        if person.age > person.legalDrivingAge {
            canDrive = true
        }
        XCTAssertEqual(canDrive, person.canDrive())
    }
    
    
}
