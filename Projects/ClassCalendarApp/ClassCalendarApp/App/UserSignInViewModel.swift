//
//  UserSignInViewModel.swift
//  ClassCalendarApp
//
//  Created by Logan Steven Bartell on 1/28/26.
//
import Foundation
import SwiftUI

@Observable
class UserSignInViewModel {
    let apiController: APIController = APIController()
    var email = "inaimus@yahoo.com"
    var password = "zohnig-3sydfI-rempag"
    var validSignIn = false
    var invalidAttempt = false
    var loading = false
    var user: User?
    
    func invalidAttemptButtonPress() {
        invalidAttempt = true
    }
    
    func resetAttempt() {
        invalidAttempt = false
    }
    
    func attemptSignIn() {
        Task {
            loading = true
            defer { loading = false }
            do {
               user = try await apiController.fetchUser(email: email, password: password)
                print(user!)
            } catch {
                print(error)
            }
        }
    }
}
