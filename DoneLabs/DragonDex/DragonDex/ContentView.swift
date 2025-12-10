//
//  ContentView.swift
//  DragonDex
//
//  Created by Logan Steven Bartell on 12/4/25.
//

import SwiftUI

struct ContentView: View {
    @State var ridersRouter = RidersRouter()
    @State var dragonRouter = DragonRouter()
    @State var backgroundSettings = BackgroundSettings()
    var body: some View {
            TabView {
                NavigationStack(path: $dragonRouter.navigationPath) {
                    DragonListView()
                        .navigationDestination(for: DragonRouter.DragonRoute.self) { route in
                            dragonRouter.view(for: route)
                        }
                        .toolbar {
                            ToolbarItem(id: "settings", placement: .topBarTrailing) {
                                settingsButton()
                            }
                        }
                }
                .environment(dragonRouter)
                NavigationStack(path: $ridersRouter.navigationPath) {
                    RiderListView()
                        .navigationDestination(for: RidersRouter.RidersRoute.self) { route in
                            ridersRouter.view(for: route)
                        }
                        .toolbar {
                            ToolbarItem(id: "settings", placement: .topBarTrailing) {
                                settingsButton()
                            }
                        }
                }
                .environment(ridersRouter)
            }
            .sheet(isPresented: $backgroundSettings.isShowingSettingsSheet) {
                SettingsSheetView()
            }
            .environment(backgroundSettings)
        }
    // ViewBuilders
    
    private func settingsButton() -> some View {
        Button {
            backgroundSettings.isShowingSettingsSheet = true
        } label: {
            Image(systemName: "gear")
        }    }
}


#Preview {
    ContentView()
}
