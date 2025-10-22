//
//  ContentView.swift
//  LifecycleLab
//
//  Created by Logan Steven Bartell on 10/21/25.
//

import SwiftUI


struct ContentView: View {
    @State var events = ""
    @Environment(\.scenePhase) var scenePhase
    var body: some View {
        NavigationStack {
            VStack {
                Text(events)
                    .onChange(of: scenePhase) { _, newPhase in
                        if newPhase == .inactive {
                            events.append("App Inactive ")
                        } else if newPhase == .active {
                            events.append("App activated ")
                        } else if newPhase == .background {
                            events.append("App backgrounded ")
                        }
                    }
                NavigationLink {
                    SecondView(events: $events)
                } label: {
                    Text("Second View")
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
