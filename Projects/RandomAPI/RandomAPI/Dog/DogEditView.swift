//
//  DogEditView.swift
//  RandomAPI
//
//  Created by Logan Steven Bartell on 11/24/25.
//

import SwiftUI

struct DogEditView: View {
    @Binding var dog: Dog
    var body: some View {
        ScrollView {
            VStack {
                Text(dog.name)
                    .font(.largeTitle)
                
                AsyncImage(url: URL(string: dog.imageUrl)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)
                .padding()
                
                Text("Rename?")
                    .foregroundStyle(.gray)
                
                TextField("Rename?", text: $dog.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
        }
    }
}

