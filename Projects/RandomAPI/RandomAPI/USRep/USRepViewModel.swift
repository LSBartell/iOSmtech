//
//  USRepViewModel.swift
//  RandomAPI
//
//  Created by Logan Steven Bartell on 11/24/25.
//
import Foundation

@Observable
class USRepViewModel {
    var usRepList: [USRep] = []
    var zipCodeInput = ""
    var isLoading = false
    var errorMessage: String?
    var invalideZip = true
    let usRepAPIController = USRepAPIController()
    
    func zipCodeValidate(zipcode: String) {
        if zipCodeInput.count == 5 && zipCodeInput.allSatisfy( { $0.isNumber } ) {
            invalideZip = false
        } else {
            invalideZip = true
        }
    }
    
    func fetchUSReps(zipcode: String) async {
        isLoading = true
        defer { isLoading = false }
        do {
            usRepList = try await usRepAPIController.fetchUSReps(zipCode: zipCodeInput)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

protocol USRepAPIControllerProtocol {
    func fetchUSReps(zipCode: String) async throws -> [USRep]
}


class USRepAPIController: USRepAPIControllerProtocol {
    enum USRepAPIError: Error, LocalizedError {
        case couldNotFind
    }
    func fetchUSReps(zipCode: String) async throws -> [USRep] {
        let USRepSearchURL = URL(string: "https://whoismyrepresentative.com/getall_mems.php?zip=\(zipCode)&output=json")
        
        let (data, response) = try await URLSession.shared.data(from: USRepSearchURL!)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw USRepAPIError.couldNotFind
        }
        
        let decoder = JSONDecoder()
        let searchResponse = try decoder.decode(USRepSearchResponse.self, from: data)
        return searchResponse.results
    }
}

class StubMockUSRepAPIController: USRepAPIControllerProtocol {
    
    func fetchUSReps(zipCode: String) async throws -> [USRep] {
        if zipCode == "Meh" {
            [USRep(name: "Logan", party: "Da Bomb", state: "Utah", link: "Nah no link brah")]
        } else {
            throw FakeError.fakeError
        }
    }
    
}



enum FakeError: Error {
    case fakeError
}

