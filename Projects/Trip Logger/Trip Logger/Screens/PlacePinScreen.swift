//
//  PlacePinScreen.swift
//  Trip Logger
//
//  Created by Jane Madsen on 4/29/25.
//


import SwiftUI
import SwiftData
import MapKit
import PhotosUI

struct PlacePinScreen: View {
    @State var viewModel: NewTripViewModel
    
    var body: some View {
        VStack {
            MapReader { reader in // Allows conversion of a touch gesture into coordinates
                Map {
                    // TODO: Display the pin the user placed
                    if let firstEntry = viewModel.newTrip.journalEntries.first,
                       let journalEntryMarker = firstEntry.location.mapItem {
                        Marker(item: journalEntryMarker)
                    }
                }
                .simultaneousGesture(SpatialTapGesture()
                    .onEnded { event in
                        let location = event.location
                        viewModel.placePin(reader: reader, location: location)
                    }
                )
            }
            HStack {
                Button {
                    viewModel.previousScreen()
                } label: {
                    Text("Back")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.gray)
                        )

                }
                
                Button {
                    viewModel.nextScreen()
                } label: {
                    Text("Next")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.gray)
                        )
                }
                .disabled(viewModel.disablePlacePinNextButton)
            }
        }
        .navigationTitle("Trip: \(viewModel.newTrip.name), Place First Pin")
    }
}

//#Preview {
//    PlacePinScreen()
//        .modelContainer(ModelContainer.preview)
//}
