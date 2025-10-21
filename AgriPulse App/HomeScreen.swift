//
//  HomeScreen.swift
//  AgriPulse App
//
//  Created by Confate Muleya  on 15/10/2025.
//

import SwiftUI

struct HomeScreen: View {
    @State private var selectedMarket: String = "Victoria Falls"
    @State private var dailyPrices: [String: Double] = [:]
       
       let markets = ["Victoria Falls", "Bulawayo", "Harare"]
    
       
       
       let Prices: [String: [String: [Double]]] = [
           "Victoria Falls": [
               "Cattle": [400, 405, 410, 415, 420, 425, 430],
               "Sheep": [40, 41, 42, 43, 44, 45, 46],
               "Maize": [60, 61, 62, 63, 64, 65, 66],
               "Sorghum": [75, 76, 77, 78, 79, 80, 81],
               "Tomato": [20, 21, 22, 23, 24, 25, 26],
               "Watermelon": [30, 31, 32, 33, 34, 35, 36],
               "Manure": [15, 16, 17, 18, 19, 20, 21],
               "Hay": [10, 11, 12, 13, 14, 15, 16]
           ],
           "Bulawayo": [
               "Cattle": [410, 415, 420, 425, 430, 435, 440],
               "Sheep": [42, 43, 44, 45, 46, 47, 48],
               "Maize": [62, 63, 64, 65, 66, 67, 68],
               "Sorghum": [77, 78, 79, 80, 81, 82, 83],
               "Tomato": [21, 22, 23, 24, 25, 26, 27],
               "Watermelon": [31, 32, 33, 34, 35, 36, 37],
               "Manure": [16, 17, 18, 19, 20, 21, 22],
               "Hay": [11, 12, 13, 14, 15, 16, 17]
           ],
           "Harare": [
               "Cattle": [420, 425, 430, 435, 440, 445, 450],
               "Sheep": [44, 45, 46, 47, 48, 49, 50],
               "Maize": [64, 65, 66, 67, 68, 69, 70],
               "Sorghum": [79, 80, 81, 82, 83, 84, 85],
               "Tomato": [22, 23, 24, 25, 26, 27, 28],
               "Watermelon": [32, 33, 34, 35, 36, 37, 38],
               "Manure": [17, 18, 19, 20, 21, 22, 23],
               "Hay": [12, 13, 14, 15, 16, 17, 18]
           ]
       ]
    
       
       // MARK:- Date feature
       
       var formattedDate: String {
           let formatter = DateFormatter()
           formatter.dateStyle = .full
           return formatter.string(from: Date())
       }
       
       // Get the weekday index 0...6 (Sunday = 0)
       func weekdayIndex() -> Int {
           let calendar = Calendar.current
           let weekday = calendar.component(.weekday, from: Date()) // 1 = Sunday, ... 7 = Saturday
           return weekday - 1
       }
       
       
       func refreshDailyPrices() {
           guard let commodities = Prices[selectedMarket] else { return }
           
           let dayIndex = weekdayIndex()
           
           var newPrices: [String: Double] = [:]
           
           for (commodity, prices) in commodities {
               if prices.indices.contains(dayIndex) {
                   newPrices[commodity] = prices[dayIndex]
               }
           }
           
           dailyPrices = newPrices
       }
       
       var body: some View {
           NavigationView {
               VStack(alignment: .leading, spacing: 16) {
                   
                   VStack(alignment: .leading, spacing: 4) {
                       Text("Price Board")
                           .font(.largeTitle)
                           .fontWeight(.bold)
                       
                       Text(formattedDate)
                           .font(.subheadline)
                           .foregroundColor(.gray)
                   }
                   .padding(.horizontal)
                   
                   Spacer()
                   
                   HStack {
                       Text("Market")
                           .font(.headline)
                       Spacer()
                       Picker("Market", selection: $selectedMarket) {
                           ForEach(markets, id: \.self) { market in
                               Text(market)
                           }
                       }
                       .pickerStyle(MenuPickerStyle())
                       .onChange(of: selectedMarket) { _ in
                           refreshDailyPrices()
                       }
                   }
                   .padding(.horizontal)
                   
                   Divider()
                   
                   List {
                       HStack {
                           Text("Commodity")
                               .font(.headline)
                           Spacer()
                           Text("USD")
                               .font(.headline)
                       }
                       
                       ForEach(dailyPrices.sorted(by: { $0.key < $1.key }), id: \.key) { commodity, price in
                           HStack {
                               Text(commodity)
                               Spacer()
                               Text(String(format: "%.2f", price))
                           }
                       }
                   }
                   .listStyle(.plain)
                   
                   NavigationLink {
                       PriceComparisonPage()
                   } label: {
                       ZStack {
                           RoundedRectangle(cornerRadius: 40)
                               .frame(width: 150, height: 50)
                               .offset(x: 100)
                               .foregroundColor(.green)
                           Text("Compare")
                               .offset(x: 100)
                               .font(.title2)
                               .fontWeight(.bold)
                               .foregroundColor(.white)
                       }
                   }
                   .buttonStyle(.plain)
                   .padding(.horizontal)
                   
                   Spacer()
               }
               .navigationBarHidden(true)
               .onAppear {
                   refreshDailyPrices()
               }
           }
       }
    }

#Preview {
    HomeScreen()
}
