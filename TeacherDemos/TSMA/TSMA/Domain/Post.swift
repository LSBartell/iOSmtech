//
//  Post.swift
//  TSMA
//
//  Created by Nathan Lambson on 11/5/25.
//

import Foundation

struct Post: Identifiable, Equatable, Sendable, Codable {
    let id: String
    let author: User
    let title: String
    let body: String
    let likeCount: Int
    let commentCount: Int
    let createdAt: Date
}
