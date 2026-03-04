//
//  SettingsView.swift
//  InterviewChallengeTwo
//
//  Created by Logan Steven Bartell on 2/25/26.
//

import SwiftUI

struct SettingsSheet: View {
    @Environment(Settings.self) var settings
    var body: some View {
        @Bindable var settings = settings
        VStack {
            List {
                Toggle("Show User First Name", isOn: $settings.showUserFirstName)
                
                Toggle("Show User Last Name", isOn: $settings.showUserLastName)
                
                Toggle("Show User Title", isOn: $settings.showUserTitle)
                
                Toggle("Show User Image", isOn: $settings.showUserImage)
                
                Toggle("Show User Gender", isOn: $settings.showUserGender)
                
                Toggle("Show User Email", isOn: $settings.showUserEmail)
                
                Toggle("Show User Age", isOn: $settings.showUserAge)
            }
        }
    }
}
