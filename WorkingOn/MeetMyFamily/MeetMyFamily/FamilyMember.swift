//
//  Untitled.swift
//  MeetMyFamily
//
//  Created by Logan Steven Bartell on 10/9/25.
//
import Foundation
import SwiftUI

struct FamilyMember: Identifiable {
    var id: UUID = UUID()
    
    let firstName: String
    let lastName: String
    let isMarried: Bool
    let picture: Image
    let favoriteColor: Color
    let Age: Int
    var hasBeenSeen: Bool
}

extension FamilyMember {
    static let family: [FamilyMember] = [
        FamilyMember(firstName: "Maren", lastName: "Bartell", isMarried: true, picture: Image("Maren"), favoriteColor: .yellow, Age: 24, hasBeenSeen: false),
        FamilyMember(firstName: "Mark", lastName: "Bartell", isMarried: false, picture: Image("Mark"), favoriteColor: .red, Age: 5, hasBeenSeen: false),
        FamilyMember(firstName: "ElleJay", lastName: "Bartell", isMarried: false, picture: Image("ElleJay"), favoriteColor: .green, Age: 4, hasBeenSeen: false),
        FamilyMember(firstName: "Aaron", lastName: "Bartell", isMarried: false, picture: Image("Aaron"), favoriteColor: .pink, Age: 3, hasBeenSeen: false)
    ]
}
