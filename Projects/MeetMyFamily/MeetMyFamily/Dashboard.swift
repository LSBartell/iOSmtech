//
//  ContentView.swift
//  MeetMyFamily
//
//  Created by Logan Steven Bartell on 10/9/25.
//

import SwiftUI

struct Dashboard: View {
    @State var family = FamilyMember.family
    @State var selectedMember: FamilyMember?
    var body: some View {
        NavigationStack {
            VStack {
                Text("Meet My Family")
                    .font(.largeTitle)
                List($family) { $familyMember in
                    Button {
                        selectedMember = familyMember
                        familyMember.hasBeenSeen = true
                    } label: {
                        HStack {
                            familyMember.picture
                                .resizable()
                                .scaledToFit()
                                .frame(height: 150)
                            Text(familyMember.firstName)
                                .font(.title)
                                .foregroundStyle(.black)
                            Spacer()
                            if familyMember.hasBeenSeen {
                                Image(systemName: "checkmark.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 50)
                                    .foregroundStyle(.green)
                            } else {
                                Image(systemName: "checkmark.circle.badge.xmark.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 50)
                                    .foregroundStyle(.red)
                            }
                        }
                    }
                    
                }
            }
            .sheet(item: $selectedMember) { member in
                MemberDetails(familyMember: member)
            }
        }
    }
}

#Preview {
    Dashboard()
}
