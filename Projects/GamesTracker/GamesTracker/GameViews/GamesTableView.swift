//
//  ContentView.swift
//  GamesTracker
//
//  Created by Logan Steven Bartell on 12/10/25.
//

import SwiftUI
import SwiftData

struct GamesTableView: View {
    @State var viewModel: GamesTableViewModel
    var body: some View {
        NavigationStack {
            List {
                if viewModel.games.isEmpty {
                    Text("No Games Yet")
                } else {
                    ForEach(viewModel.games) { game in
//                        Section {
                            NavigationLink {
                                GameEditView(viewModel: GameEditViewModel(dataSource: SwiftDataService(modelContext: viewModel.dataSource.modelContext), game: game))
                            } label: {
                                gameCellView(game: game)
                            }
//                        }
                    }
                    .onMove(perform: viewModel.moveGame(from:to:))
                    .onDelete(perform: viewModel.didDeleteGame(_:))
                }
            }
            .navigationTitle("Games Tracker")
            .onAppear {
                viewModel.fetchGames()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        AddNewGameView(viewModel: AddNewGameViewModel(dataSource: SwiftDataService(modelContext: viewModel.dataSource.modelContext)))
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    //builderViews
    func gameCellView(game: Game) -> some View {
        HStack {
            Image(systemName: game.icon)
                .resizable()
                .frame(width: 75, height: 75)
                .padding()
            Spacer()
            VStack {
                Text("Game")
                    .underline()
                Text(game.name)
                    .bold()
            }
            .padding()
            Spacer()
            VStack {
                Text("Winner")
                    .underline()
                Text(game.winner)
            }
            .padding()
        }
    }
}

#Preview {
    GamesTableView(viewModel: GamesTableViewModel(dataSource: SwiftDataService.preview))
}



