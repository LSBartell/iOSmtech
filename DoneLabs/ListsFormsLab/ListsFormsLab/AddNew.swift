//
//  AddNew.swift
//  ListsFormsLab
//
//  Created by Logan Steven Bartell on 10/8/25.
//

import SwiftUI

struct AddNew: View {
    @State var newId = ""
    @State var newType = ""
    @State var newTopSpeed = ""
    @State var newNumberOfSeats = ""
    
    @Binding var vehicleList: [Vehicle]
    
    func addNewVehicle() {
        vehicleList.append(Vehicle(id: newId, type: newType, topSpeed: newTopSpeed, numberOfSeats: newNumberOfSeats))
    }
    
    var body: some View {
        
        VStack {
            Text("Add New")
                .font(.title2)
                .underline()
            TextField("New Name", text: $newId, prompt: Text("Name"))
            TextField("New Type", text: $newType, prompt: Text("Type"))
            TextField("New Top Speed", text: $newTopSpeed, prompt: Text("Top Speed"))
            TextField("New Seats", text: $newNumberOfSeats, prompt: Text("Number Of Seats"))
            Button("Add", action: addNewVehicle)
        }
    }
}

