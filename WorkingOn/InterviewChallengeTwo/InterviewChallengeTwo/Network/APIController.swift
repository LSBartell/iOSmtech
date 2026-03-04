//
//  APIController.swift
//  InterviewChallengeTwo
//
//  Created by Logan Steven Bartell on 2/25/26.
//
import Foundation

class APIController {
    
    enum QueryError: Error, LocalizedError {
        case badResponse
        case systemError
    }
    
    func fetchUsers(_ count: Int) async throws -> UsersResults {
        
        do {
            let url = URL(string: "https://randomuser.me/api/?results=\(count)")
            
            let (data, response) = try await URLSession.shared.data(from: url!)
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    let decoder = JSONDecoder()
                    let results = try decoder.decode(UsersResults.self, from: data)
                    return results
                } else {
                    throw QueryError.badResponse
                }
            } else {
                throw QueryError.systemError
            }
        }
        
    }
    
}
