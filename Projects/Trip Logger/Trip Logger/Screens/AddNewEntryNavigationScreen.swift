//
//  AddNewEntryNavigationScreen.swift
//  Trip Logger
//
//  Created by Logan Steven Bartell on 1/20/26.
//

import SwiftUI

struct AddNewEntryNavigationScreen: View {
    @State var viewModel: EditTripScreenViewModel
    
    var body: some View {
        switch viewModel.displayPinScreen {
        case .addPin:
            AddNewPinScreen(viewModel: viewModel)
        case .editPin:
            SetUpNewPinScreen(viewModel: viewModel)
        }
    }
}

