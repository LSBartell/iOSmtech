//
//  ContentView.swift
//  iTunesSearch
//
//  Created by Jane Madsen on 11/3/25.
//

import SwiftUI

@Observable
class StoreItemListViewModel {
    var previewTask: Task<Void, Never>? = nil
    var items: [StoreItem] = []
    
    var searchText: String
    var selectedMediaType: MediaType
    var storeItemController: StoreItemController
    init(items: [StoreItem] = [], searchText: String = "", selectedMediaType: MediaType = .music, storeItemController: StoreItemController = StoreItemController()) {
        self.items = items
        self.searchText = searchText
        self.selectedMediaType = selectedMediaType
        self.storeItemController = storeItemController
    }

    func  fetchMatchingItems() {
        if !searchText.isEmpty {
            // set up query dictionary
            let query: [String: String] = [
                "term" : "\(searchText)",
                "media" : "\(selectedMediaType.rawValue)",
                "limit" : "5"
            ]
            // use the item controller to fetch items
            Task {
                do {
                    try await self.items = storeItemController.fetchItems(matching: query)
                } catch {
                    print(error)
                }
            }
            // if successful, use the main queue to set self.items
            // otherwise, print an error to the console
        }
    }
    func fetchPreview(item: StoreItem) {
        if let previewTask {
            previewTask.cancel()
        }
        
        previewTask = Task {
            do {
                if let previewUrl = item.previewUrl, let url = URL(string: previewUrl) {
                   let data = try await storeItemController.fetchPreview(from: url)
                    print(data)
                }
            } catch {
                
            }
        }
    }
}

struct StoreItemListView: View {
    @State private var viewModel = StoreItemListViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                Picker("Media Type", selection: $viewModel.selectedMediaType) {
                    ForEach(MediaType.allCases, id: \.self) { mediaType in
                        Text(mediaType.rawValue.capitalized)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding([.horizontal, .top])

                HStack {
                    TextField("Search...", text: $viewModel.searchText) {
                        // onCommit
                        // When the user hits Return on their keyboard, this closure will trigger
                        viewModel.fetchMatchingItems()
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .submitLabel(.search)
                    .padding([.horizontal, .bottom])
                }
                
                List(viewModel.items, id: \.self) { item in
                    ItemCellView(storeItem: item, onPlayButtonPressed: {viewModel.fetchPreview(item: item)})
                }
                .listStyle(.plain)
            }
            .navigationTitle("iTunes Search")
            .onAppear {
                viewModel.fetchMatchingItems()
            }
        }
    }
}

#Preview {
 StoreItemListView()
}
