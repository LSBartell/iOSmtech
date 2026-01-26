//
//  NwTripScreenRouterView.swift
//  Trip Logger
//
//  Created by Logan Steven Bartell on 1/13/26.
//

import SwiftUI

struct NewTripScreenRouterView: View {
    @State var viewModel: NewTripViewModel
    var body: some View {
        switch viewModel.currentScreen {
        case 1:
            NewTripScreen(viewModel: viewModel)
        case 2:
            PlacePinScreen(viewModel: viewModel)
        case 3:
            SetUpPinScreen(viewModel: viewModel)
        default:
            Text("error, out of range")
        }
    }
}

