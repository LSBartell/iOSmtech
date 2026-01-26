//
//  AddNewGameView.swift
//  GamesTracker
//
//  Created by Logan Steven Bartell on 12/12/25.
//

import SwiftUI

struct AddNewGameView: View {
    @State var viewModel: AddNewGameViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        if viewModel.isChoosingIcon == false {
            mainView()
                .transition(
                    .asymmetric(
                        insertion: .scale.combined(with: .opacity),
                        removal: .slide.combined(with: .opacity))
                )
        } else {
            iconsView()
                .transition(
                    .asymmetric(
                        insertion: .scale,
                        removal: .scale.combined(with: .opacity))
                )
        }
    }
    //ViewBuilders
    func mainView() -> some View {
        ScrollView {
            VStack{
                Text("Add New Game")
                    .font(.largeTitle)
                Spacer()
                    .frame(height: 30)
                Text("Choose Icon")
                    .underline()
                mainViewIconButton()
                Spacer()
                    .frame(height: 30)
                Text("New Game Name")
                    .underline()
                TextField("Name", text: $viewModel.newGameName)
                    .multilineTextAlignment(.center)
                    .padding()
                Text("Game Score Type")
                    .underline()
                gameScoreTypeButton()
                Spacer()
                    .frame(height: 30)
                Text("Winner Type")
                    .underline()
                gameWinnerTypeButton()
                Spacer()
                    .frame(height: 30)
                Text("Add New Player")
                    .underline()
                addPlayerButton()
                    .alert("Add new player", isPresented: $viewModel.isShowingAddPlayerAlert) {
                        addPlayerAlert()
                    }
                Spacer()
                    .frame(height: 30)
                Text("Players")
                    .font(.title)
                    .underline()
                ForEach(viewModel.newGamePlayers) { player in
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
                Spacer(minLength: 50)
                RoundedRectangle(cornerRadius: 40)
                    .frame(width: 300, height: 5)
                    .foregroundStyle(.gray)
                HStack {
                    saveButton()
                        .padding()
                    cancelButton()
                }
            }
            
        }
    }
    
    func mainViewIconButton() -> some View {
        Button {
            withAnimation {
                viewModel.isChoosingIcon.toggle()
            }
        } label: {
            Image(systemName: viewModel.newGameIcon)
                .resizable()
                .frame(width: 100,height: 100)
        }
    }
    
    func iconsView() -> some View {
        ScrollView {
            ForEach(viewModel.gameIconList, id: \.self) { icon in
                Button {
                    withAnimation {
                        viewModel.newGameIcon = icon.rawValue
                        viewModel.isChoosingIcon.toggle()
                    }
                } label: {
                    Image(systemName: icon.rawValue)
                        .resizable()
                        .frame(width: 100,height: 100)
                }
            }
        }
    }
    
    func addPlayerButton() -> some View {
        Button {
            viewModel.isShowingAddPlayerAlert = true
        } label: {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 100, height: 100)
        }
    }
    
    func gameScoreTypeButton() -> some View {
        if viewModel.newGameType == .highest {
            Button {
                withAnimation {
                    viewModel.newGameType = .lowest
                }
            } label: {
                Text("Highest")
                    .foregroundStyle(.white)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 40)
                            .foregroundStyle(.blue)
                    )
            }
            .transition(.slide.combined(with: .scale))
            .id("highestScoreType")
        } else {
            Button {
                withAnimation {
                    viewModel.newGameType = .highest
                }
            } label: {
                Text("Lowest")
                    .foregroundStyle(.white)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 40)
                            .foregroundStyle(.red)
                    )
            }
            .transition(.slide.combined(with: .scale))
            .id("lowestScoreType")
        }
    }
    
    func gameWinnerTypeButton() -> some View {
        if viewModel.newGameWinnerType == .highest {
            Button {
                withAnimation {
                    viewModel.newGameWinnerType = .lowest
                }
            } label: {
                Text("Highest")
                    .foregroundStyle(.white)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 40)
                            .foregroundStyle(.blue)
                    )
            }
            .transition(.slide.combined(with: .scale))
            .id("highestIsWinner")
        } else {
            Button {
                withAnimation {
                    viewModel.newGameWinnerType = .highest
                }
            } label: {
                Text("Lowest")
                    .foregroundStyle(.white)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 40)
                            .foregroundStyle(.red)
                    )
            }
            .transition(.slide.combined(with: .scale))
            .id("lowestIsWinner")
        }
    }
    
    func cancelButton() -> some View {
        Button {
            viewModel.cancel()
            dismiss()
        } label: {
            Text("Cancel")
                .padding()
                .font(.title)
                .foregroundStyle(.white)
                .background(
                    RoundedRectangle(cornerRadius: 40)
                        .foregroundStyle(.red)
                )
        }    }
    
    func saveButton() -> some View {
        Button {
            viewModel.saveGame()
            dismiss()
        } label: {
            Text("Save")
                .padding()
                .font(.title)
                .foregroundStyle(.white)
                .background(
                    RoundedRectangle(cornerRadius: 40)
                        .foregroundStyle(.blue)
                )
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

#Preview {
    AddNewGameView(viewModel: AddNewGameViewModel(dataSource: .preview))
}
