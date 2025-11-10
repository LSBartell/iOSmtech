//
//  NetworkClient.swift
//  TSMA
//
//  Created by Nathan Lambson on 11/5/25.
//

import Foundation

protocol NetworkClientProtocol: Sendable {
    func fetchCurrentUser() async throws -> User
    func fetchPosts(pageNumber: Int) async throws -> [Post]
}

actor MockNetworkClient: NetworkClientProtocol {
    func fetchCurrentUser() async throws -> User {
        try await Task.sleep(nanoseconds: 80_000_000)
        return await Self.sampleAda
    }

    func fetchPosts(pageNumber: Int) async throws -> [Post] {
        try await Task.sleep(nanoseconds: 120_000_000)
        return await [
            Post(id: "p1",
                 author: Self.sampleAda,
                 title: "Welcome",
                 body: "This is the first sample post.",
                 likeCount: 12,
                 commentCount: 3,
                 createdAt: .now),
            Post(id: "p2",
                 author: Self.sampleAlan,
                 title: "Second Post",
                 body: "Timeline loads from a repository.",
                 likeCount: 7,
                 commentCount: 1,
                 createdAt: .now.addingTimeInterval(-3600))
        ]
    }

    private static let sampleAda = User(
        id: "u_ada",
        firstName: "Ada",
        lastName: "Lovelace",
        userName: "@ada",
        biography: "Poet of numbers",
        techInterests: ["Swift","Architecture","UI"],
        profileImageURL: nil,
        coverImageURL: nil
    )

    private static let sampleAlan = User(
        id: "u_alan",
        firstName: "Alan",
        lastName: "Turing",
        userName: "@alan",
        biography: "Machines and thought",
        techInterests: ["Math","Security"],
        profileImageURL: nil,
        coverImageURL: nil
    )
}
