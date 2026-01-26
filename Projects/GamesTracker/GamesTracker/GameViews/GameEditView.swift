//
//  GameEditView.swift
//  GamesTracker
//
//  Created by Logan Steven Bartell on 12/18/25.
//

import SwiftUI

struct GameEditView: View {
    @State var viewModel: GameEditViewModel
    var body: some View {
        VStack {
            if viewModel.game.players.isEmpty {
                Text("No Players Yet")
            } else {
                ForEach(viewModel.game.players.sorted(by: { $0.score > $1.score } )) { player in
                    ZStack {
                        RoundedRectangle(cornerRadius: 40)
                            .foregroundStyle(.blue)
                            .frame(width: 350, height: 50)
                        HStack {
                            Spacer()
                                .frame(width: 50)
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 45, height: 45)
                            Text(player.name)
                            Spacer()
                            Text("Score:")
                            Button {
                                player.score -= 1
                            } label: {
                                Image(systemName: "minus")
                                    .foregroundStyle(.black)
                            }
                            Text("\(player.score)")
                            Button {
                                player.score += 1
                            } label: {
                                Image(systemName: "plus")
                                    .foregroundStyle(.black)
                            }
                            Spacer()
                                .frame(width: 50)
                        }
                    }
                }
            }
        }

            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.isShowingAddPlayerAlert = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }            .alert("Add new player", isPresented: $viewModel.isShowingAddPlayerAlert) {
                addPlayerAlert()
            }
    }
    
    func addPlayerAlert() -> some View {
        Group {
            TextField("Player Name", text: $viewModel.newPlayerName)
            Button("Add") {
                viewModel.addPlayer()
            }
            Button("Cancel") {
                viewModel.cancelAddPlayer()
            }
        }
    }
}

