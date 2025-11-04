import UIKit

var query: [String: String] = [
    "term" : "fall+out+boy",
    "media" : "music"
]

addMusicSearchQuery(artist: "Led Zeppelin")

var urlComponents = URLComponents(string: "https://itunes.apple.com/search")!
urlComponents.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }

Task {
    let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
    
    if let httpResponse = response as? HTTPURLResponse,
       httpResponse.statusCode == 200,
       let string = String(data: data, encoding: .utf8) {
        print(string)
    }
}


@MainActor func addMusicSearchQuery(artist: String) {
    var mutableString = artist.lowercased()
    mutableString = mutableString.replacingOccurrences(of: " ", with: "+")
    query = [ "term": "\(mutableString)", "media" : "music" ]
}

