//
//  SetUpNewPinScreen.swift
//  Trip Logger
//
//  Created by Logan Steven Bartell on 1/19/26.
//
import Foundation
import SwiftUI
import SwiftData
import MapKit
import PhotosUI

struct SetUpNewPinScreen: View {
    @State var viewModel: EditTripScreenViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("Name your pin, and add notes to this stop")
            
            List {
                Section("Name") {
                    TextField("Name", text: $viewModel.newEntryName)
                        .onChange(of: viewModel.newEntryName) {
                            viewModel.updateNewEntry()
                        }
                }
                
                Section("Notes") {
                    TextField("Notes", text: $viewModel.newEntryText)
                        .onChange(of: viewModel.newEntryText) {
                            viewModel.updateNewEntry()
                        }
                }
            }
            Button {
                viewModel.saveNewEntry()
                dismiss()
            } label: {
                Text("Save")
            }
        }
    }
}
