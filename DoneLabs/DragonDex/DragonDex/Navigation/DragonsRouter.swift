//
//  DragonsRouter.swift
//  DragonDex
//
//  Created by Logan Steven Bartell on 12/4/25.
//
import Foundation
import SwiftUI

@Observable
class DragonRouter {
    
    var navigationPath = NavigationPath()
    
    enum DragonRoute: Hashable {
        case dragonList
        case dragonDetail(dragon: Dragon)
        case powers(powers: [Power])
    }
    
    @ViewBuilder
    func view(for route: DragonRoute) -> some View {
        switch route {
        case .dragonList:
            DragonListView()
        case .dragonDetail(let dragon):
            DragonDetailView(dragon: dragon)
        case .powers(let powers):
            PowersView(powers: powers)
        }
    }
    
    func navigateTo(route: DragonRoute) {
        navigationPath.append(route)
    }
}
