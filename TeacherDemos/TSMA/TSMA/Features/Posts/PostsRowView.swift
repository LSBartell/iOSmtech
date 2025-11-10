//
//  PostsRowView.swift
//  TSMA
//
//  Created by Nathan Lambson on 11/5/25.
//

import SwiftUI

struct PostRowView: View {
    let post: Post

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(post.author.firstName) \(post.author.lastName) • @\(post.author.userName)")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text(post.title)
                .font(.headline)

            Text(post.body)
                .font(.body)

            HStack(spacing: 16) {
                Label("\(post.likeCount)", systemImage: "hand.thumbsup")
                Label("\(post.commentCount)", systemImage: "text.bubble")
            }
            .font(.footnote)
            .foregroundStyle(.secondary)
        }
        .padding(.vertical, 8)
    }
}

#if DEBUG
extension User {
    static let sample = User(id: "u_dbg", firstName: "Ada", lastName: "Lovelace", userName: "ada", biography: "Poet of numbers", techInterests: ["Swift","UI"], profileImageURL: nil, coverImageURL: nil)
}
extension Post {
    static let sample = Post(id: "p_dbg", author: .sample, title: "Sample", body: "Preview content", likeCount: 1, commentCount: 0, createdAt: .now)
}
#Preview {
    PostRowView(post: .sample)
}
#endif
