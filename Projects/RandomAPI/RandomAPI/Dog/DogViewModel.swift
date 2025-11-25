//
//  DogViewModel.swift
//  RandomAPI
//
//  Created by Logan Steven Bartell on 11/21/25.
//
import Foundation

@Observable
class DogViewModel {
    var newDogImage: Dog?
    var doglist: [Dog] = []
    let dogAPIController = DogAPIController()
    var addDogName = ""
    var loadingDog = false
    var errorMessage: String?
    
    func fetchRandomDog() async {
        loadingDog = true
        defer { loadingDog = false }
        do {
            self.newDogImage = try await dogAPIController.fetchRandomDog()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
}

protocol DogAPIControllerProtocol {
    func fetchRandomDog() async throws -> Dog
}


class DogAPIController: DogAPIControllerProtocol {
    enum dogAPIError: Error, LocalizedError {
        case couldNotFind
    }
    
    func fetchRandomDog() async throws -> Dog {
        let url = "https://dog.ceo/api/breeds/image/random"
        
        let (data, response) = try await URLSession.shared.data(from: URL(string: url)!)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw dogAPIError.couldNotFind
        }
//        print(String(data: data, encoding: .utf8))
        let decoder = JSONDecoder()
        let dogSearchResponse = try decoder.decode(Dog.self, from: data)
        return dogSearchResponse
    }
}
