//
//  EditEntryScreen.swift
//  Trip Logger
//
//  Created by Logan Steven Bartell on 1/19/26.
//

import SwiftUI

struct EditEntryScreen: View {
    @State var viewModel: EditEntryScreenViewModel
    
    var body: some View {
        VStack {
            Text("Edit Entry: \(viewModel.entry.name)")
                .font(.title)
                .underline()
            
            List {
                Section("Name") {
                    TextField("Name", text: $viewModel.entry.name)
                }
                Section("Description") {
                    TextField("Description", text: $viewModel.entry.text)
                }
                Section("Photos") {
                    PhotoScrollView(journalEntry: viewModel.entry)
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    EditEntryScreen(viewModel: EditEntryScreenViewModel(entry: Trip.mock().journalEntries.first!))
}
