//
//  BackgroundSettings.swift
//  DragonDex
//
//  Created by Logan Steven Bartell on 12/4/25.
//
import Foundation
import SwiftUI

@Observable
class BackgroundSettings {
    var backgroundColor: Color = .red
    var isShowingSettingsSheet = false
    
    func changeColor(color: Color) {
        backgroundColor = color
    }
}

