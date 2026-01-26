//
//  SetUpPinScreen.swift
//  Trip Logger
//
//  Created by Jane Madsen on 4/29/25.
//


import SwiftUI
import SwiftData
import MapKit
import PhotosUI

struct SetUpPinScreen: View {
    @State var viewModel: NewTripViewModel
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("Name your first pin, add photos, and add notes to this stop")
            TextField("Entry name", text: $viewModel.newTrip.journalEntries.first!.name)
            TextField("Description", text: $viewModel.newTrip.journalEntries.first!.text)
            PhotoScrollView(journalEntry: viewModel.newTrip.journalEntries.first!)
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
                    modelContext.insert(viewModel.newTrip)
                    dismiss()
                } label: {
                    Text("Save")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.gray)
                        )
                }
                .disabled(viewModel.disableSaveButton)
                .onChange(of: viewModel.newTrip.journalEntries.first!.name) {
                    viewModel.checkIfCanSave()
                }
                .onChange(of: viewModel.newTrip.journalEntries.first!.text) {
                    viewModel.checkIfCanSave()
                }
            }
        }
    }
}

//#Preview {
//    SetUpPinScreen()
//}
