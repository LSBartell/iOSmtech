//
//  JournalEntryDetailView.swift
//  JournalApp
//
//  Created by Logan Steven Bartell on 12/2/25.
//

import SwiftUI
import SwiftData

struct JournalEntryDetailView: View {
    var journalEntry: JournalEntry?
    var journal: Journal
    @State var titleString = ""
    @State var bodyString = ""
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    init(journalEntry: JournalEntry?, journal: Journal) {
        self.journalEntry = journalEntry
        self.journal = journal
        _titleString = State(initialValue: journalEntry?.title ?? "")
        _bodyString = State(initialValue: journalEntry?.body ?? "")
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Title", text: $titleString, prompt: Text("Title"))
                    .font(.title)
                    .bold()
                    .underline()
                    .padding()
                if let date = journalEntry?.date {
                    Text(date.formatted(date: .numeric, time: .omitted))
                        .underline()
                }
            }
            TextField("Entry", text: $bodyString, prompt: Text("Entry"))
            Spacer()
            Button {
                save()
                dismiss()
            } label: {
                Text("save")
            }
        }
    }
    
    func save() {
        if journalEntry == nil {
            context.insert(JournalEntry(title: titleString, body: bodyString, date: journalEntry?.date ?? Date.now, journal: journal))
        } else {
            journalEntry?.title = titleString
            journalEntry?.body = bodyString
        }
    }
}

