//
//  RidersRouter.swift
//  DragonDex
//
//  Created by Logan Steven Bartell on 12/4/25.
//
import Foundation
import SwiftUI

@Observable
class RidersRouter {
    
    var navigationPath = NavigationPath()
    
    enum RidersRoute: Hashable {
        case ridersList
        case riderDetail
        case riderSkills
    }
    
    @ViewBuilder
    func view(for route: RidersRoute) -> some View {
        switch route {
        case .ridersList:
            RiderListView()
        case .riderDetail:
            RidersDetailView()
        case .riderSkills:
            RidersSkillView()
        }
    }
    
    func navigateTo(route: RidersRoute) {
        navigationPath.append(route)
    }
}

