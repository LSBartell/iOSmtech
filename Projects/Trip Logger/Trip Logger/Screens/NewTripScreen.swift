//
//  NewTripView.swift
//  Trip Logger
//
//  Created by Jane Madsen on 4/29/25.
//

import SwiftUI
import SwiftData
import MapKit
import PhotosUI

struct NewTripScreen: View {
    @State var viewModel: NewTripViewModel
    var body: some View {
        NavigationStack {
            VStack {
                Text("First, give a name to your trip.")
                    .font(.title2)
                    .fontWeight(.bold)
                TextField("Name", text: $viewModel.newTripName)
                    .padding(.leading, 50)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.blue)
                    )
                Button {
                    viewModel.resetTrip()
                    viewModel.addTripName()
                    viewModel.nextScreen()
                } label: {
                    Text("Next")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.gray)
                        )
                }
                .disabled(viewModel.disableTripNameNextButton)
                .onChange(of: viewModel.newTripName) {
                    viewModel.changeTripNameNextButton()
                }
            }
            .padding()
        }
    }
}

//#Preview {
//    NewTripScreen(viewModel: NewTripViewModel())
//        .modelContainer(ModelContainer.preview)
//}
