//
//  TabView.swift
//  AgriPulse App
//
//  Created by Confate Muleya  on 16/10/2025.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        
        TabView {
            HomeScreen()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            Profile()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
            
            Settings()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
            
        }
        .accentColor(.green)
    }
}

#Preview {
    MainTabView()
}
