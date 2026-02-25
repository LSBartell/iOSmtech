//
//  ContentView.swift
//  InterviewChallengeOne
//
//  Created by Logan Steven Bartell on 2/24/26.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query var users: [User]
    @State private var isShowingAddUserAlert = false
    @State private var newUser = ""
    @State private var selectedNumber = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                
                addUserButtonAlert()
                
                if users.isEmpty {
                    Text("No Users")
                } else {
                    List {
                        ForEach(users) { user in
                            userCellView(user: user)
                        }
                        .onMove(perform: move)
                        .onDelete(perform: delete)
                    }
                }
                
                Spacer()
                
                selectRandomUsersView()
                
            }
            .onAppear() {
                updateSelectionNumber()
            }
            .padding()
            .alert("Add new user", isPresented: $isShowingAddUserAlert) {
                addUserAlert()
            }
        }
    }
    
    //Builder Views
    
    private func addUserButtonAlert() -> some View {
        Button {
            isShowingAddUserAlert = true
        } label: {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
        }
        .padding()
    }
    
    private func userCellView(user: User) -> some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .padding(4)
                .foregroundStyle(user.isSelected == true ? .green : .black)
            Text(user.name)
                .foregroundStyle(user.isSelected == true ? .green : .black)
        }
    }
    
    private func addUserAlert() -> some View {
        Group {
            TextField("New User Name", text: $newUser)
            Button("Cancel", role: .cancel) {
                newUser = ""
            }
            Button("Save") {
                save()
            }
        }
    }
    
    private func selectRandomUsersView() -> some View {
        VStack {
            Text("Select Number of random users")
            Picker("Select number of random Users", selection: $selectedNumber) {
                ForEach(0..<(users.count + 1), id: \.self) { number in
                    Text("\(number)")
                }
            }
            Button("Select Users") {
                selectRandom()
            }
        }
    }
    
}

//Private Functions
private extension ContentView {
    func save() {
        if !newUser.isEmpty {
            context.insert(User(name: newUser))
            newUser = ""
        }
    }
    
    func delete(_ offsets: IndexSet) {
        for index in offsets {
            context.delete(users[index])
        }
    }
    
    func selectRandom() {
        for user in users {
            user.isSelected = false
        }
        
        if users.count == selectedNumber {
            for user in users {
                user.isSelected = true
            }
        } else {
            let indices = Array(users.indices).shuffled().prefix(selectedNumber)
            for index in indices {
                users[index].isSelected = true
            }
        }
    }
    
    private func updateSelectionNumber() {
        var selectedCount = 0
        for user in users {
            if user.isSelected {
                selectedCount += 1
            }
        }
        selectedNumber = selectedCount
    }
    
    func move(from source: IndexSet, to destination: Int) {
        var revisedUsers = users
        revisedUsers.move(fromOffsets: source, toOffset: destination)
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for: [User.self, UserList.self])
}

