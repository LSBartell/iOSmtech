//
//  ItemCellView.swift
//  iTunesSearch
//
//  Created by Jane Madsen on 11/3/25.
//

import SwiftUI

struct ItemCellView: View {
    let storeItem: StoreItem
    let onPlayButtonPressed: () -> Void

    var body: some View {
        HStack {


            if let artworkUrl = storeItem.artwork {
                AsyncImage(url: URL(string: artworkUrl))
                    .frame(width: 75, height: 75)
                    .padding(8)
            } else {
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 75, height: 75)
                        .foregroundColor(.gray)
                }
                
            VStack(alignment: .leading) {
                Text(storeItem.songTitle)
                    .font(.headline)
                Text(storeItem.artist)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            

            if let previewUrl = storeItem.previewUrl {
                Button {
                    onPlayButtonPressed()
                } label: {
                    Image(systemName: "play.circle")
                }
            }
        }
        .padding(.vertical, 8)
    }
}
