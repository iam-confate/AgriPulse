//
//  AgriPulse_AppApp.swift
//  AgriPulse App
//
//  Created by Confate Muleya  on 15/10/2025.
//

import SwiftUI

@main
struct AgriPulse_AppApp: App {
    @StateObject private var settings = SettingsManager.shared
    
    var body: some Scene {
        WindowGroup {
            LaunchScreen()
                .preferredColorScheme(settings.isDarkMode ? .dark : .light)
        }
    }
}

//state object variable here
