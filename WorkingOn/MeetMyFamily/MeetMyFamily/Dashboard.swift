//
//  ContentView.swift
//  MeetMyFamily
//
//  Created by Logan Steven Bartell on 10/9/25.
//

import SwiftUI

struct Dashboard: View {
    @State var family = FamilyMember.family
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Meet My Family")
                    .font(.largeTitle)
                List($family) { $familyMember in
                    Button {
                        
                    } label: {
                        HStack {
                            familyMember.picture
                                .resizable()
                                .scaledToFit()
                                .frame(height: 150)
                            Text(familyMember.firstName)
                                .font(.title)
                                .foregroundStyle(.black)
                        }
                        }
                    }
                    
                }
            }
        }
    }

#Preview {
    Dashboard()
}
