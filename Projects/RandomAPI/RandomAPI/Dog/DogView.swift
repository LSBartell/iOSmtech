//
//  DogView.swift
//  RandomAPI
//
//  Created by Logan Steven Bartell on 11/21/25.
//

import SwiftUI

struct DogView: View {
    @State var viewModel = DogViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("Mans Best Friend!")
                        .font(.largeTitle)
                    
                    dogImageView()
                    
                    TextField("Name?", text: $viewModel.addDogName)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    
                    generateNewDogButton()
                    
                    saveAndGenerateNewDogButton()
                    
                    Text("Saved Dogs")
                        .font(.title)
                        .bold()
                        .underline()
                    
                    historySection()
                }
            }
        }
        .task {
            await viewModel.fetchRandomDog()
        }
    }
    
    func dogImageView() -> some View {
        Group {
            if viewModel.loadingDog {
                Image(systemName: "photo")
                    .frame(width: 300, height: 300)
            } else if let message = viewModel.errorMessage {
                ContentUnavailableView("Could Not Load", systemImage: "exclamationmark.triangle", description: Text(message))
            } else {
                AsyncImage(url: URL(string: viewModel.newDogImage?.imageUrl ?? "")) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)
                .padding()
            }
        }
    }
            
    func saveAndGenerateNewDogButton() -> some View {
        Button(action: saveDog) {
            Text("Save and generate new")
                .foregroundStyle(.black)
                .padding(7)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                )
        }
    }
    
    func generateNewDogButton() -> some View {
        Button(action: newDog) {
            Text("Generate new dog")
                .foregroundStyle(.black)
                .padding(7)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                )
        }
    }
    
    func historySection() -> some View {
        ForEach($viewModel.doglist) { $dog in
            Section {
                NavigationLink {
                    DogEditView(dog: $dog)
                } label: {
                    HStack {
                        AsyncImage(url: URL(string: dog.imageUrl)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                        Text(dog.name)
                    }
                }
            }
        }
    }
}

private extension DogView {
    
    func saveDog() {
        let newDog = Dog(name: viewModel.addDogName, imageUrl: viewModel.newDogImage?.imageUrl ?? "")
        viewModel.doglist.append(newDog)
        Task {
            await viewModel.fetchRandomDog()
        }
        viewModel.addDogName = ""
        print(viewModel.doglist)
    }
    
    func newDog() {
        Task {
            await viewModel.fetchRandomDog()
        }
    }
}

#Preview {
    DogView()
}
