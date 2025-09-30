//
//  ContentView.swift
//  PropertyWrappers
//
//  Created by Logan Steven Bartell on 9/26/25.
//

import SwiftUI



let dogApp = DogApp()

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Dog Walker")
                .font(.largeTitle)
            
            Spacer()
            
            Button(action: {}, label: {
                HStack {
                    Spacer()
                    Text("Add a Dog")
                    Image(systemName: "dog.fill")
                    Spacer()
                }
            })
            
        }
    }
}

#Preview {
    ContentView()
}
