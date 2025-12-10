//
//  JournalsView.swift
//  JournalApp
//
//  Created by Logan Steven Bartell on 12/3/25.
//

import SwiftUI
import SwiftData

struct JournalsView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Journal.date, order: .reverse) var journals: [Journal]
    @State private var isShowingAddJournalAlert = false
    @State private var newJournalTitle = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Journals")
                    .font(.largeTitle)
                    .bold()
                    .underline()
                    .padding()
                if journals.isEmpty {
                    noJournalsView()
                } else {
                    List {
                        journalsListView()
                    }
                }
                Spacer()
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowingAddJournalAlert = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .alert("Add new journal", isPresented: $isShowingAddJournalAlert) {
                addJournalAlert()
            }
        }
    }
    
    //Builder Views
    
    private func noJournalsView() -> some View {
        VStack {
            Spacer()
            Text("No Journals Yet")
            Spacer()
        }
    }
    
    private func journalsListView() -> some View {
        Section {
            ForEach(journals) { journal in
                NavigationLink {
                    JournalView(journal: journal)
                } label: {
                    HStack {
                        Text(journal.title)
                            .bold()
                            .underline()
                            .padding()
                        Spacer()
                        Text(journal.date.formatted(date: .numeric, time: .omitted))
                            .underline()
                            .padding()
                    }
                }
            }
            .onDelete(perform: delete)
        }
    }
    
    private func addJournalAlert() -> some View {
        Group {
            TextField("Journal Title", text: $newJournalTitle)
            Button("Cancel", role: .cancel) {
                newJournalTitle = ""
            }
            Button("Save") {
                save()
            }
        }
    }
    func delete(_ offsets: IndexSet) {
        for index in offsets {
            context.delete(journals[index])
        }
    }
}

//Private functions
private extension JournalsView {
    func save() {
        context.insert(Journal(title: newJournalTitle, date: Date.now, entries: []))
        newJournalTitle = ""
    }
}


#Preview {
    JournalsView()
        .modelContainer(for: Journal.self)
}
