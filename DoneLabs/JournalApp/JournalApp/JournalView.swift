//
//  ContentView.swift
//  JournalApp
//
//  Created by Logan Steven Bartell on 12/2/25.
//

import SwiftUI
import SwiftData

struct JournalView: View {
    @State var journal: Journal
    @Environment(\.modelContext) private var context
    @Query var journalEntries: [JournalEntry]
    
    init(journal: Journal) {
        self.journal = journal
        let journalId = journal.persistentModelID
        
        _journalEntries = Query(
            filter: #Predicate<JournalEntry> { entry in
                entry.journal?.persistentModelID == journalId
            },
            sort: \.date,
            order: .reverse
        )
    }

    @State var showAddNew = false
    var body: some View {
        NavigationStack {
            VStack {
                Text(journal.title)
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
                                    JournalEntryDetailView(journalEntry: entry, journal: journal)
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
                            JournalEntryDetailView(journalEntry: nil, journal: journal)
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

