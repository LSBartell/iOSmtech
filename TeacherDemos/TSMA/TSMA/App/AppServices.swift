//
//  AppServices.swift
//  TSMA
//
//  Created by Nathan Lambson on 11/5/25.
//

import Foundation
import Combine

@Observable
final class AppServices {
    private(set) var isReady: Bool = true

    let networkClient: NetworkClientProtocol
    let userRepository: UserRepositoryProtocol

    init(networkClient: NetworkClientProtocol, userRepository: UserRepositoryProtocol) {
        self.networkClient = networkClient
        self.userRepository = userRepository
    }
}
