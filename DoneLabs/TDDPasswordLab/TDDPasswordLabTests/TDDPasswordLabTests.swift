//
//  TDDPasswordLabTests.swift
//  TDDPasswordLabTests
//
//  Created by Logan Steven Bartell on 1/27/26.
//

import XCTest
@testable import TDDPasswordLab

final class TDDPasswordLabTests: XCTestCase {
    
    func testPasswordSizeMin_failCase() {
        let testBool = PasswordValidation.passwordSizeMin(password: "Pass")
        XCTAssertFalse(testBool)
    }
    
    func testPasswordSizeMin_passCase() {
        let testBool = PasswordValidation.passwordSizeMin(password: "Password")
        XCTAssert(testBool)
    }
    
    func testPasswordSizeMax_failCase() {
        let testBool = PasswordValidation.passwordSizeMax(password: "qqqqqqqqqqqqqqqqqqqqqqqqqqqwshtedrtjrydtesdkyrdtextreisrkyxrxrtotditrerysydtuesdrysitrietsrysitestesyxykcrtiyxltyrdyrdxrtjdyrdrysieskrysteirs")
        XCTAssertFalse(testBool)
    }
    
    func testPasswordSizeMax_passCase() {
        let testBool = PasswordValidation.passwordSizeMax(password: "Password")
        XCTAssert(testBool)
    }
    
    func testContainsLowerCase_failCase() {
        let testBool = PasswordValidation.containsLowerCase(password: "PASSWORD")
        XCTAssertFalse(testBool)
    }
    
    func testContainsLowerCase_passCase() {
        let testBool = PasswordValidation.containsLowerCase(password: "Password")
        XCTAssert(testBool)
    }
    
    func testContainsUpperCase_failCase() {
        let testBool = PasswordValidation.containsUpperCase(password: "password")
        XCTAssertFalse(testBool)
    }
    
    func testContainsUpperCase_passCase() {
        let testBool = PasswordValidation.containsUpperCase(password: "Password")
        XCTAssert(testBool)
    }
    
    func testConatinsNumber_failCase() {
        let testBool = PasswordValidation.containsNumber(password: "Password")
        XCTAssertFalse(testBool)
    }
    
    func testContainsNumber_passCase() {
        let testBool = PasswordValidation.containsNumber(password: "Password1")
        XCTAssert(testBool)
    }
    
    func testConatinsSpecial_failCase() {
        let testBool = PasswordValidation.containsSpecial(password: "Password")
        XCTAssertFalse(testBool)
    }
    
    func testContainsSpecial_passCase() {
        let testBool = PasswordValidation.containsSpecial(password: "Password!")
        XCTAssert(testBool)
    }
    
    func testNoPatterns_failCase() {
        let testBool = PasswordValidation.noPatterns(password: "2222")
        XCTAssertFalse(testBool)
    }
    
    func testNoPatterns_passCase() {
        let testBool = PasswordValidation.noPatterns(password: "Yubadoba")
        XCTAssert(testBool)
    }
    
}
