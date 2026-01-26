//
//  MainRouter.swift
//  Trip Logger
//
//  Created by Logan Steven Bartell on 1/13/26.
//
import Foundation
import SwiftUI

@Observable
class NewTripRouter {
    var navigationPath = NavigationPath()
    
    enum NewTripRoute: Hashable {
        case newTrip(NewTripViewModel)
        case placePin(NewTripViewModel)
        case setUpPin(NewTripViewModel)
        
        static func == (lhs: NewTripRoute, rhs: NewTripRoute) -> Bool {
            switch (lhs, rhs) {
            case let (.newTrip(lhsVM), .newTrip(rhsVM)):
                return ObjectIdentifier(lhsVM) == ObjectIdentifier(rhsVM)
            case let (.placePin(lhsVM), .placePin(rhsVM)):
                return ObjectIdentifier(lhsVM) == ObjectIdentifier(rhsVM)
            case let (.setUpPin(lhsVM), .setUpPin(rhsVm)):
                return ObjectIdentifier(lhsVM) == ObjectIdentifier(rhsVm)
            default:
                return false
            }
        }
        
        func hash(into hasher: inout Hasher) {
            switch self {
            case .newTrip(let viewModel):
                hasher.combine(0)
                hasher.combine(ObjectIdentifier(viewModel))
            case .placePin(let viewModel):
                hasher.combine(1)
                hasher.combine(ObjectIdentifier(viewModel))
            case .setUpPin(let viewModel):
                hasher.combine(2)
                hasher.combine(ObjectIdentifier(viewModel))
            }
        }
    }
    
    @ViewBuilder
    func view(for route: NewTripRoute) -> some View {
        switch route {
        case .newTrip(let viewModel):
            NewTripScreen(viewModel: viewModel)
        case .placePin(let viewModel):
            PlacePinScreen(viewModel: viewModel)
        case .setUpPin(let viewModel):
            SetUpPinScreen(viewModel: viewModel)
        }
    }
    
    func navigateTo(route: NewTripRoute) {
        navigationPath.append(route)
    }
}
