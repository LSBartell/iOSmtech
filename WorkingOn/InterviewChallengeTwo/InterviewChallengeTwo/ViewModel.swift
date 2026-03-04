//
//  ViewModel.swift
//  InterviewChallengeTwo
//
//  Created by Logan Steven Bartell on 2/25/26.
//
import Foundation

@Observable
class ViewModel {
    let apiController = APIController()
    var userList: [User] = []
    var isShowingSettingsSheet = false
    var userListCount = 0
    var isLoading = false
    
    //settings variables
    var showUserFirstName = true
    var showUserLastName = true
    var showUserTitle = true
    var showUserImage = true
    var showUserGender = true
    var showUserEmail = true
    var showUserAge = true
    
    func settingsButton() {
        isShowingSettingsSheet = true
    }
    
    func fetchUsers() {
        Task {
            isLoading = true
            defer { isLoading = false }
            do {
                let results = try await apiController.fetchUsers(userListCount)
                userList = results.users
            } catch {
                print(error)
            }
        }
    }
    
}
