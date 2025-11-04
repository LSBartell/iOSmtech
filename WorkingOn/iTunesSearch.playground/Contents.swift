import UIKit

var query: [String: String] = [
    "term" : "Apple",
    "media" : "music",
    "limit" : "1"
]

//musicSearchQuery(artist: "Led Zeppelin")


extension Data {
    func prettyPrintedJSONString() {
        guard
            let jsonObject = try?
                JSONSerialization.jsonObject(with: self, options: []),
            let jsonData = try?
                JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]),
            let prettyJSONString = String(data: jsonData, encoding: .utf8) else {
            print("Failed to read Json Object.")
            return
        }
        print(prettyJSONString)
    }
}

//Task {
//    let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
//    
//    if let httpResponse = response as? HTTPURLResponse,
//       httpResponse.statusCode == 200 {
//        data.prettyPrintedJSONString()
//    }
//}


//@MainActor func musicSearchQuery(artist: String) {
//    var mutableString = artist.lowercased()
//    mutableString = mutableString.replacingOccurrences(of: " ", with: "+")
//    query = [ "term": "\(mutableString)", "media" : "music" ]
//}

struct StoreItem: Codable {
    let artist: String
    let songTitle: String
    let collectionTitle: String
    let trackPrice: Double
    
    enum CodingKeys: String, CodingKey {
        case artist = "artistName"
        case songTitle = "trackName"
        case collectionTitle = "collectionName"
        case trackPrice
    }
}

struct SearchResponse: Codable {
    let results: [StoreItem]
}

enum queryError: Error, LocalizedError {
    case couldNotFind
}

func fetchItems(matching query: [String: String]) async throws -> [StoreItem] {
    var urlComponents = URLComponents(string: "https://itunes.apple.com/search")!
    urlComponents.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
    
    let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
    
    guard let httpResponse = response as? HTTPURLResponse,
          httpResponse.statusCode == 200 else {
        throw queryError.couldNotFind
    }
    let decoder = JSONDecoder()
    let searchResponse = try decoder.decode(SearchResponse.self, from: data)
    return searchResponse.results
}

Task {
    do {
        let results = try await fetchItems(matching: query)
        print(results)
    } catch {
        print(error)
    }
}
