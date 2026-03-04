//
//  UsersView.swift
//  InterviewChallengeTwo
//
//  Created by Logan Steven Bartell on 2/25/26.
//

import SwiftUI

struct UsersView: View {
    @State var settings = Settings()
    @State var viewModel: ViewModel
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    
                    userCountPicker()
                    
                    searchButtonView()
                    
                    Group {
                        if viewModel.isLoading {
                            ProgressView("Loading")
                        } else {
                            ForEach(viewModel.userList) { user in
                                UserCellView(settings: settings, viewModel: viewModel, user: user)
                            }
                        }
                    }
                    
                    Spacer()
                }
                
            }
            .sheet(isPresented: $viewModel.isShowingSettingsSheet) {
                SettingsSheet()
            }
            .navigationTitle("Random User Search")
            .toolbar {
                showSettingsButton()
            }
        }
        .environment(settings)
    }
    
    //View builders
    
    func showSettingsButton() -> some View {
        Button() {
            viewModel.isShowingSettingsSheet = true
        } label: {
            Image(systemName: "gear")
        }
    }
    
    func userCountPicker() -> some View {
        HStack {
            Text("Amount of users to search:")
                .bold()
            Picker("search amount",
                   selection: $viewModel.userListCount,
                   content: {
                ForEach(0...10, id: \.self) { number in
                    Text("\(number)")
                }
            })
        }
    }
    
    func searchButtonView() -> some View {
        Button("Search") {
            viewModel.fetchUsers()
        }
    }

}

#Preview {
    UsersView(viewModel: ViewModel())
}
