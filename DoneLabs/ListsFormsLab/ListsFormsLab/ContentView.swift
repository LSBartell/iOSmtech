//
//  ContentView.swift
//  ListsFormsLab
//
//  Created by Logan Steven Bartell on 10/7/25.
//

import SwiftUI


struct ContentView: View {
    @State var showAddNew = false
    @State var showEditScreen = false
    @State var vehicleList: [Vehicle] = [
        Vehicle(id: "My Car", type: "Car", topSpeed: "100", numberOfSeats: "4"),
        Vehicle(id: "My Bike", type: "Bike", topSpeed: "15", numberOfSeats: "1"),
        Vehicle(id: "My Boat", type: "Boat", topSpeed: "25", numberOfSeats: "8")
    ]
    
    
    func delete(_ offsets: IndexSet) {
        vehicleList.remove(atOffsets: offsets)
    }
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach($vehicleList) { $vehicle in
                        Section {
                            NavigationLink {
                                EditScreen(vehicle: $vehicle)
                            } label: {
                                VStack {
                                    Text(vehicle.id)
                                        .bold()
                                        .underline()
                                    Text("""
Type: \(vehicle.type)
Top Speed: \(vehicle.topSpeed)mph
Seats: \(vehicle.numberOfSeats)
""")
                                    
                                }
                                
                            }
                        }
                    }
                    .onDelete(perform: delete)
                    .swipeActions(edge: .leading) {
                        Button("Edit") {
                            showEditScreen = true
                        }
                    }
                        Button {
                            showAddNew = true
                        } label: {
                            Text("Add New")
                        }
                    .sheet(isPresented: $showAddNew) {
                        AddNew(vehicleList: $vehicleList)
                    }
                }
                .padding()
            }
        }
    }
}
#Preview {
    ContentView()
}
