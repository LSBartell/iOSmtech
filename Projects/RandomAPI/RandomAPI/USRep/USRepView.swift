//
//  USRepView.swift
//  RandomAPI
//
//  Created by Logan Steven Bartell on 11/24/25.
//

import SwiftUI

struct USRepView: View {
    @State var viewModel = USRepViewModel()
    var body: some View {
        VStack {
            Text("US Representative search")
                .font(.title)
                .bold()
                .underline()
            Text("5 digit zipcode")
            TextField("Zipcode", text: $viewModel.zipCodeInput)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .padding()
                .onChange(of: viewModel.zipCodeInput) { _, newValue in
                    viewModel.zipCodeValidate(zipcode: newValue)
                }
                
            Button(action: search) {
                Text("Search")
                    .foregroundStyle(.black)
                    .padding(6)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                    )
            }
            .disabled(viewModel.invalideZip)
            Group {
                if viewModel.isLoading {
                    ProgressView()
                } else if let message = viewModel.errorMessage {
                    ContentUnavailableView("Could Not Load", systemImage: "exclamationmark.triangle", description: Text(message))
                } else {
                    List {
                        ForEach(viewModel.usRepList) { usRep in
                            USRepCellView(usRep: usRep)
                        }
                    }
                }
            }
            Spacer()
        }
    }
}

private extension USRepView {
    func search() {
        Task {
            await viewModel.fetchUSReps(zipcode: viewModel.zipCodeInput)
            print(viewModel.usRepList)
        }
    }
}

#Preview {
    USRepView()
}
