//
//  EditScreen.swift
//  ListsFormsLab
//
//  Created by Logan Steven Bartell on 10/8/25.
//

import SwiftUI

struct EditScreen: View {
    @Binding var vehicle: Vehicle
    
    var body: some View {
        Form {
            Section(header: Text(vehicle.id)) {
                HStack {
                    Text("Type:")
                        .bold()
                    TextField("Type", text: $vehicle.type, prompt: Text(vehicle.type))
                }
                HStack {
                    Text("Top Speed:")
                        .bold()
                    TextField("Top Speed", text: $vehicle.topSpeed, prompt: Text(vehicle.topSpeed))
                }
                HStack {
                    Text("Number of Seats")
                        .bold()
                    TextField("Number of Seats", text: $vehicle.numberOfSeats, prompt: Text(vehicle.numberOfSeats))
                }
            }
        }
    }
}


