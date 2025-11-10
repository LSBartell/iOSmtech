//
//  TimelineViewModel.swift
//  TSMA
//
//  Created by Nathan Lambson on 11/5/25.
//

import Foundation
import Combine

@Observable
final class PostsViewModel {
    private(set) var posts: [Post] = []
    private(set) var isLoading: Bool = false
    private(set) var errorMessage: String?

    private let networkClient: NetworkClientProtocol

    init(networkClient: NetworkClientProtocol) {
        self.networkClient = networkClient
    }

    func load() {
        Task {
            isLoading = true
            defer { isLoading = false }
            do { posts = try await networkClient.fetchPosts(pageNumber: 0) }
            catch { errorMessage = "Failed to load posts" }
        }
    }
}
