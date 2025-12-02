//
//  ContentView.swift
//  JournalApp
//
//  Created by Logan Steven Bartell on 12/2/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \JournalEntry.date, order: .reverse) var journalEntries: [JournalEntry]
    @State var showAddNew = false
    var body: some View {
        NavigationStack {
            VStack {
                Text("My Journal")
                    .font(.largeTitle)
                    .bold()
                    .underline()
                    .padding()
                List {
                    if journalEntries.isEmpty {
                        Text("No Entries Yet")
                    } else {
                        ForEach(journalEntries) { entry in
                            Section {
                                NavigationLink {
                                    JournalEntryDetailView(journalEntry: entry)
                                } label: {
                                    HStack {
                                        Text(entry.title)
                                    }
                                }
                            }
                        }
                        .onDelete(perform: delete)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            showAddNew = true
                        } label: {
                            Image(systemName: "plus")
                        }
                        .sheet(isPresented: $showAddNew) {
                            JournalEntryDetailView(journalEntry: nil)
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
    func delete(_ offsets: IndexSet) {
        for index in offsets {
            context.delete(journalEntries[index])
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: JournalEntry.self)
}
