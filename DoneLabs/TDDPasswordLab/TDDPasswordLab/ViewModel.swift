//
//  ViewModel.swift
//  TDDPasswordLab
//
//  Created by Logan Steven Bartell on 1/27/26.
//
import Foundation
import SwiftUI

@Observable
class ViewModel {
    var passwordOverMin = false
    var passwordUnderMax = true
    var passwordHasNumber = false
    var passwordHasSpecial = false
    var passwordNoPatterns = true
    var passwordHasUpper = false
    var passwordHasLower = false
    var passwordIsGood = false
    var password = ""
    
    func updatePasswordStatus(password: String) {
        passwordOverMin = PasswordValidation.passwordSizeMin(password: password)
        passwordUnderMax = PasswordValidation.passwordSizeMax(password: password)
        passwordHasNumber = PasswordValidation.containsNumber(password: password)
        passwordHasSpecial = PasswordValidation.containsSpecial(password: password)
        passwordNoPatterns = PasswordValidation.noPatterns(password: password)
        passwordHasLower = PasswordValidation.containsLowerCase(password: password)
        passwordHasUpper = PasswordValidation.containsUpperCase(password: password)
        
        if passwordOverMin && passwordUnderMax && passwordHasNumber && passwordHasSpecial && passwordNoPatterns && passwordHasLower && passwordHasUpper {
            passwordIsGood = true
        } else {
            passwordIsGood = false
        }
    }
}
