//
//  Settings.swift
//  AgriPulse App
//
//  Created by Confate Muleya  on 16/10/2025.
//

import SwiftUI
import UserNotifications
import Combine

class SettingsManager: ObservableObject {
    static let shared = SettingsManager()
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
}


struct Settings: View {
    
    @ObservedObject private var settings = SettingsManager.shared
    @Environment(\.dismiss) private var dismiss
    @State private var selectedMarket = "Victoria Falls"
    @State private var selectedLanguage = "English"
    @State private var notificationsEnabled = false
    @State private var goHome = false
       
       let markets = ["Victoria Falls", "Bulawayo", "Harare"]
       let languages = ["English", "Tonga", "Ndebele", "French", "Shona"]
       
       var body: some View {
           NavigationView {
               ZStack {
                   
                   VStack {
                       
                       VStack(alignment: .leading) {
                           
                           Button(action: {
                               goHome = true
                           }) {
                               Image(systemName: "chevron.left")
                                   .font(.title2)
                                   .foregroundColor(.white)
                           }
                           
                           
                           HStack(alignment: .center, spacing: 15) {
                               VStack(alignment: .leading, spacing: 4) {
                                   Text("Settings")
                                       .font(.largeTitle)
                                       .bold()
                                       .foregroundColor(.white)
                                   
                                   Text("Confate Muleya")
                                       .font(.headline)
                                       .foregroundColor(.white.opacity(0.9))
                               }
                               
                               Spacer()
                               NavigationLink(destination: Profile()) {
                                   Image(systemName: "person.circle.fill")
                                       .resizable()
                                       .scaledToFit()
                                       .frame(width: 70, height: 70)
                                       .foregroundColor(.white)
                               }
                               .buttonStyle(.plain)
                           }
                       }
                       .padding(.horizontal)
                       .padding(.top, 50)
                       .padding(.bottom, 20)
                       .frame(maxWidth: .infinity)
                       .background(Color.green)
                       .ignoresSafeArea(edges: .top)
                       
                       
                       Form {
                           Section(header: Text("General")) {
                               Picker(selection: $selectedMarket, label:
                                        HStack {
                                   Image(systemName: "cart.fill")
                                       .foregroundColor(.green)
                                   Text("Market")
                               }
                               ) {
                                   ForEach(markets, id: \.self) { market in
                                       Text(market)
                                   }
                               }
                               .tint(.green)
                               
                               Picker(selection: $selectedLanguage, label:
                                        HStack {
                                   Image(systemName: "globe")
                                       .foregroundColor(.green)
                                   Text("Language")
                               }
                               ) {
                                   ForEach(languages, id: \.self) { language in
                                       Text(language)
                                   }
                               }
                               .tint(.green)
                           }
                           
                           Section(header: Text("Preferences")) {
                               Toggle(isOn: $notificationsEnabled) {
                                   HStack {
                                       Image(systemName: "bell.fill")
                                           .foregroundColor(.green)
                                       Text("Notifications")
                                   }
                               }
                               .tint(.green)
                               
                               Toggle(isOn: $settings.isDarkMode) {
                                   HStack {
                                       Image(systemName: "moon.fill")
                                           .foregroundColor(.green)
                                       Text("Dark Theme")
                                   }
                               }
                               .tint(.green)
                           }
                       }
                       NavigationLink(destination: HomeScreen()) {
                           Text("Logout")
                               .frame(width: 150, height: 20)
                               .padding()
                               .background(Color.green)
                               .foregroundColor(.white)
                               .cornerRadius(8)
                               .offset(y: -100)
                       }
                   }
                       .padding(.top, -60)
                       .scrollContentBackground(.hidden)
                       .background(settings.isDarkMode ? Color.black : Color.white)
                   }
                   
                  

                   .navigationDestination(isPresented:  $goHome){
                       HomeScreen()
                   }
               }
               .navigationBarHidden(true)
           }
       }


#Preview {
    Settings()
}
