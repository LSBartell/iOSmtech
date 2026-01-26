//
//  AddNewPinScreen.swift
//  Trip Logger
//
//  Created by Logan Steven Bartell on 1/19/26.
//

import SwiftUI
import SwiftData
import MapKit
import PhotosUI

struct AddNewPinScreen: View {
    @State var viewModel: EditTripScreenViewModel
    
    var body: some View {
        VStack {
            MapReader { reader in // Allows conversion of a touch gesture into coordinates
                Map {
                    // TODO: Display the pin the user placed
                    if let newEntry = viewModel.newEntry,
                       let journalEntryMarker = newEntry.location.mapItem {
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
            if viewModel.newEntry != nil {
                Button {
                    viewModel.changeScreen(viewModel: viewModel)
                } label: {
                    Text("Next")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.gray)
                        )
                }
            }
        }
    }
}

