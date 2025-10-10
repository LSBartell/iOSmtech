//
//  MemberDetails.swift
//  MeetMyFamily
//
//  Created by Logan Steven Bartell on 10/10/25.
//

import SwiftUI

struct MemberDetails: View {
    let familyMember: FamilyMember
    var body: some View {
        ScrollView {
            VStack {
                familyMember.picture
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                Text("\(familyMember.firstName) \(familyMember.lastName)")
                    .font(.title2)
                    .modifier(WarmModifier())
                    .padding()
                if familyMember.isMarried {
                    Text("Marriage Status: Married")
                        .modifier(WarmModifier())
                } else {
                    Text("Marriage Status: Single")
                        .modifier(WarmModifier())
                }
                Text("Favorite Color")
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(familyMember.favoriteColor)
                    )
                Text("Age: \(familyMember.Age) years old")
                    .modifier(WarmModifier())
            }
        }
    }
}

