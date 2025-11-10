//
//  UserRepository.swift
//  TSMA
//
//  Created by Nathan Lambson on 11/5/25.
//

import Foundation

protocol UserRepositoryProtocol {
    func fetchCurrentUser() async throws -> User
}

struct MockUserRepository: UserRepositoryProtocol {
    func fetchCurrentUser() async throws -> User {
        User(
            id: "u1",
            firstName: "Jane",
            lastName: "Madsen",
            userName: "janem",
            biography: "iOS developer and teacher",
            techInterests: ["Swift", "SwiftUI", "GraphQL"],
            profileImageURL: nil,
            coverImageURL: nil
        )
    }
}
