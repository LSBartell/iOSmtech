//
//  NetworkService.swift
//  TestDoublesLab
//
//  Created by Logan Steven Bartell on 1/26/26.
//


protocol NetworkServiceProtocol {
    func fetchString() -> String?
}

class FakeNetworkService: NetworkServiceProtocol {
    func fetchString() -> String? {
        "My String"
    }
}

class MockNetworkService: NetworkServiceProtocol {
    var fetchStringCalled = false
    
    func fetchString() -> String? {
        fetchStringCalled = true
        return "My String"
    }
}


