//
//  Item.swift
//  SwiftDataTodoList
//
//  Created by Parker Rushton on 5/30/25.
//

import Foundation
import SwiftData

@Model
final class ToDoItem: Identifiable, Equatable {
    var id: String
    var title: String
    var createdAt: Date
    var completedAt: Date?
    
    var isCompleted: Bool {
        completedAt != nil
    }
    
    init(
        id: String = UUID().uuidString,
        title: String,
        createdAt: Date = Date(),
        completedAt: Date? = nil
    ) {
        self.id = id
        self.title = title
        self.createdAt = createdAt
        self.completedAt = completedAt
    }
}

extension ToDoItem {
    static var mockData: [ToDoItem] {
        [
            .init(title: "Buy milk"),
            .init(title: "Learn SwiftUI"),
            .init(title: "Go for a walk", completedAt: Date()),
        ]
    }

}
