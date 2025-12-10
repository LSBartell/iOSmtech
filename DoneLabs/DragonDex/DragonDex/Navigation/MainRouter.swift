//
//  Router.swift
//  DragonDex
//
//  Created by Logan Steven Bartell on 12/4/25.
//
import Foundation
import SwiftUI

@Observable
class MainRouter {
    
    var navigationPath = NavigationPath()
    
    enum MainRoute: Hashable {
        case settings
    }
    
    @ViewBuilder
    func view(for route: MainRoute) -> some View {
        switch route {
        case .settings:
            SettingsSheetView()
        }
    }
    
    func navigateTo(route: MainRoute) {
        navigationPath.append(route)
    }
}

