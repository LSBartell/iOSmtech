//
//  PasswordValidation.swift
//  TDDPasswordLab
//
//  Created by Logan Steven Bartell on 1/27/26.
//

import Foundation

class PasswordValidation {
    static func passwordSizeMin(password: String) -> Bool {
        password.count >= 8
    }
    
    static func passwordSizeMax(password: String) -> Bool {
        password.count <= 30
    }
    
    static func containsLowerCase(password: String) -> Bool {
        let lowercaseCharacters = "qwertyuiopasdfghjklzxcvbnm"
        for character in password {
            if lowercaseCharacters.contains(character) {
                return true
            }
        }
        return false
    }
    
    static func containsUpperCase(password: String) -> Bool {
        let uppercaseCharacters = "QWERTYUIOPASDFGHJKLZXCVBNM"
        for character in password {
            if uppercaseCharacters.contains(character) {
                return true
            }
        }
        return false
    }
    
    static func containsNumber(password: String) -> Bool {
        let numbers = "1234567890"
        
        for character in password {
            if numbers.contains(character) {
                return true
            }
        }
        return false
    }
    
    static func containsSpecial(password: String) -> Bool {
        let specials = "!@#$%^&*()?~`"
        
        for character in password {
            if specials.contains(character) {
                return true
            }
        }
        return false
    }
    
    static func noPatterns(password: String) -> Bool {
        let badRepeatCharacters = "1234567890qwertyuiopasdfghjklzxcvbnm"
        var patterns: [String] = ["abc", "qwerty", "123", "321"]
        
        for character in badRepeatCharacters {
            patterns.append("\(character)\(character)\(character)\(character)")
            patterns.append("\(character)\(character)\(character)")
        }
        
        for pattern in patterns {
            if password.lowercased().contains(pattern) {
                return false
            }
        }
        return true
    }
    
}
