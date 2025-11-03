//
//  ContentView.swift
//  navigationDemo
//
//  Created by Logan Steven Bartell on 10/8/25.
//

import SwiftUI

struct Student: Identifiable {
    var id: UUID = UUID()
    
    var name: String
    var favoriteColor: Color
}

let students = [Student(name: "joe", favoriteColor: .red), Student(name: "Bob", favoriteColor: .blue)]

struct ContentView: View {
    
    @State private var isPresentingSheet = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Button("present sheet") {
                    isPresentingSheet = true
                }
                List(students) { student in
                    NavigationLink {
                        student.favoriteColor
                            .ignoresSafeArea()
                    } label: {
                        Text(student.name)
                    }
                    .navigationTitle("Students")
                    .sheet(isPresented: $isPresentingSheet) {
                        Text("sheet happens")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
