//
//  AssignmentSheet.swift
//  ClassCalendarApp
//
//  Created by Logan Steven Bartell on 2/9/26.
//

import SwiftUI

struct AssignmentSheet: View {
    let assignments: [Assignment]
    var body: some View {
        VStack {
            ScrollView {
                Text("Assignments")
                    .font(.title)
                    .underline()
                    .padding()
                if assignments.isEmpty {
                    Text("No Assignments")
                        .font(.title)
                        .bold()
                } else {
                    ForEach(assignments) { assignment in
                        ZStack {
                            Color.forground
                            VStack() {
                                Text("Name: \(assignment.name ?? "No Name")")
                                    .underline()
                                    .bold()
                                    .padding(4)
                                Text("Type: \(assignment.assignmentType ?? "No Type")")
                                    .padding(4)
                                Text("Assigned On: \(assignment.assignedOn?.formatted(date: .numeric, time: .omitted) ?? "No Assigned On Date")")
                                Text("Due On: \(assignment.dueOn?.formatted(date: .numeric, time: .omitted) ?? "No Due Date")")
                                    .padding(4)
                                Text("Progress: \(assignment.progress ?? "Unknown")")
                                    .padding(.bottom, 6)
                            }
                        }
                        .padding()
                    }
                }
                
                Spacer()
            }
            .onAppear() {
                print(assignments)
            }
        }
    }
}

#Preview {
    AssignmentSheet(assignments: [Assignment(name: "Nametest", assignmentType: "TypeTest", assignedOn: Date.now, dueOn: Date(timeIntervalSinceNow: 600000), progress: "progressTest")])
}
