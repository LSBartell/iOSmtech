//
//  EditTripScreen.swift
//  Trip Logger
//
//  Created by Logan Steven Bartell on 1/16/26.
//

import SwiftUI

struct EditTripScreen: View {
    @State var viewModel: EditTripScreenViewModel
    var body: some View {
        VStack(alignment: .center) {
            Text("Edit Trip: Trip name")
                .font(.title)
                .underline()
            List {
                Section("Trip") {
                    HStack {
                        Text("Name:")
                        TextField("Name", text: $viewModel.trip.name)
                    }
                }
                Section("Entries") {
                    NavigationLink {
                        AddNewEntryNavigationScreen(viewModel: viewModel)
                    }label: {
                        Text("Add New Entry")
                            .foregroundStyle(.blue)
                    }
                    ForEach(viewModel.trip.journalEntries) { entry in
                        NavigationLink {
                            EditEntryScreen(viewModel: EditEntryScreenViewModel(entry: entry))
                        } label: {
                            HStack {
                                Image(systemName: "mappin.circle")
                                Text(entry.name)
                            }
                        }
                    }
                    .onDelete(perform: viewModel.delete)
                }
            }
        }
    }
}

