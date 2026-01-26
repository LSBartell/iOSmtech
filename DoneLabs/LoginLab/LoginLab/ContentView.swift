//
//  ContentView.swift
//  LoginLab
//
//  Created by Logan Steven Bartell on 1/5/26.
//

import SwiftUI



struct ContentView: View {
    enum LoadState {
        case idle
        case loading
        case success
        case error
    }
    @State var username = ""
    @State var password = ""
    @State var loadState: LoadState = .idle
    var body: some View {
        VStack {
            Text("Login")
                .font(.title)
                .bold()
            TextField("Username", text: $username)
                .modifier(TextfieldStyle())
            TextField("Password", text: $password)
                .modifier(TextfieldStyle())
            Button("Submit") {submitButtonPress()}
                .buttonStyle(CustomButtonStyle())
            Spacer()
            switch loadState {
            case .idle:
                Text("Press Submit")
            case .loading:
                ProgressView()
            case .success:
                Text("User Logged In!").foregroundStyle(.green)
            case .error:
                Text("Invalid Login")
                    .foregroundStyle(.red)
            }
            Spacer()
        }
        .padding()
    }
    
    func submitButtonPress() {
        Task {
            loadState = .loading
            try await Task.sleep(nanoseconds: 500_000_000)
            if username == password {
                loadState = .success
            } else {
                loadState = .error
            }
        }
    }
}

#Preview {
    ContentView()
}
