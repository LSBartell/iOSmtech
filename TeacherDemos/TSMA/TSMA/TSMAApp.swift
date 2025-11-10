//
//  TSMAApp.swift
//  TSMA
//
//  Created by Nathan Lambson on 11/5/25.
//

import SwiftUI

@main
struct TSMAApp: App {
    @State private var appServices = AppServices(
        networkClient: MockNetworkClient(),
        userRepository: MockUserRepository()
    )

    var body: some Scene {
        WindowGroup {
            RootTabView()
                .environment(appServices)
        }
    }
}
