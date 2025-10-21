//
//  PriceComparisonPage.swift
//  AgriPulse App
//
//  Created by Confate Muleya  on 15/10/2025.
//

import SwiftUI
    import Charts

struct PriceComparisonPage: View {
    
        @Environment(\.dismiss) var dismiss
        @State private var selectedCommodity = "Maize"
        @State private var selectedTimeframe = "Daily"
        @State private var timeRemaining: String = ""
        @State private var glow = false
        
        let commodities = ["Cattle", "Sheep", "Maize", "Soghurm", "Tomato", "Watermelon", "Manure", "Hay"]
        
        let timeframes = ["Daily", "Weekly", "Monthly"]
        
        // Daily (7-day), Weekly (4-week), Monthly (12-month) dummy data
        let dailyDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
        let weeklyDays = ["Wk1", "Wk2", "Wk3", "Wk4"]
        let monthlyDays = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        
        let dailyPrices: [String: [Double]] = [
            "Cattle": [390.83, 420.22, 202.45, 205.18, 197.65, 375.80, 211.40 ],
            "Sheep": [95.80, 99.45, 111.50, 130.30, 105.25, 118.50, 101.25],
            "Maize": [2.40, 2.45, 2.50, 2.60, 2.70, 2.55, 3.55],
            "Soghurm": [1.30, 1.40, 1.35, 1.50, 1.45, 1.60, 1.55],
            "Tomato": [1.10, 1.12, 2.09, 1.15, 1.11, 1.16, 1.08],
            "Watermelon": [2.10, 2.15, 2.45, 2.50, 2.75, 2.80, 2.65],
            "Manure": [2.18, 2.26, 2.24, 2.30, 2.70, 2.95, 2.88],
            "Hay": [2.05, 2.18, 2.20, 2.35, 2.80, 2.78, 2.63]
               //done
           ]
           
           let weeklyPrices: [String: [Double]] = [
            "Cattle": [390.83, 189.60, 300.00, 196.10 ],
            "Sheep": [105, 120, 130, 140],
            "Maize": [18, 20, 28, 31],
            "Soghurm": [12.5,  13.2, 13.5, 13.3],
            "Tomato": [8.2, 8.9, 9.0, 8.8],
            "Watermelon": [4.5, 5.0, 4.9, 5.1],
            "Manure": [15.0, 15.6, 15.5, 15.7],
            "Hay": [10.0, 10.4, 10.5, 10.3]
           ]
           
           let monthlyPrices: [String: [Double]] = [
            "Cattle": [250, 255, 253, 258, 260, 262, 265, 268, 270, 273, 275, 278],
            "Sheep": [150, 152, 155, 153, 157, 160, 158, 161, 163, 165, 164, 166],
            "Maize": [20.5, 21.0, 20.8, 21.2, 21.5, 21.3, 21.7, 22.0, 22.2, 22.5, 22.3, 22.6],
            "Soghurm": [12.5, 12.9, 13.1, 13.0, 13.3, 13.6, 13.4, 13.7, 13.9, 14.1, 14.0, 14.3],
            "Tomato": [8.3, 8.6, 8.7, 8.5, 8.9, 9.1, 9.0, 9.3, 9.5, 9.7, 9.6, 9.8],
            "Watermelon": [4.6, 4.8, 4.7, 4.9, 5.1, 5.0, 5.2, 5.4, 5.3, 5.5, 5.6, 5.7],
            "Manure": [15.1, 15.4, 15.3, 15.5, 15.7, 15.6, 15.8, 16.0, 16.1, 16.3, 16.2, 16.4],
            "Hay": [10.1, 10.3, 10.2, 10.4, 10.6, 10.5, 10.7, 10.9, 11.0, 11.2, 11.1, 11.3]
           ]
           
           var body: some View {
               VStack(spacing: 25) {
                   // Top bar
                   HStack {
                       Button("< Back") { dismiss() }
                           .foregroundColor(.green)
                       Spacer()
                   }
                   .padding(.horizontal)
                   
                   Text("Market Prices")
                       .font(.largeTitle)
                       .fontWeight(.bold)
                       .frame(maxWidth: .infinity, alignment: .leading)
                       .padding(.horizontal)
                   Text("Compare prices from different markets.")
                       .font(.subheadline)
                       .foregroundStyle(.gray)
                       .frame(maxWidth: .infinity, alignment: .leading)
                       .padding(.horizontal)
                   
                   // Commodity selector
                   HStack {
                       Text("Commodity")
                           .font(.headline)
                       Spacer()
                       Picker("Commodity", selection: $selectedCommodity) {
                           ForEach(commodities, id: \.self) { item in
                               Text(item)
                           }
                       }
                       .pickerStyle(MenuPickerStyle())
                       .frame(width: 140)
                   }
                   .padding(.horizontal)
                   
                   // Timeframe segmented control
                   Picker("Timeframe", selection: $selectedTimeframe) {
                       ForEach(timeframes, id: \.self) { frame in
                           Text(frame)
                       }
                   }
                   .pickerStyle(SegmentedPickerStyle())
                   .padding(.horizontal)
                   
                   // Line Chart
                   if let (labels, prices) = getDataForSelectedTimeframe() {
                       Chart {
                           ForEach(Array(prices.enumerated()), id: \.offset) { index, price in
                               LineMark(
                                   x: .value("Time", labels[index]),
                                   y: .value("Price", price)
                               )
                               .symbol(.circle)
                               .interpolationMethod(.cardinal)
                           }
                       }
                       .frame(height: 250)
                       .padding(.horizontal)
                   }
                   
                   Spacer()
                   
                   // Countdown with glowing animation
                   ZStack {
                       RoundedRectangle(cornerRadius: 12)
                           .stroke(Color.green.opacity(0.8), lineWidth: 2)
                           .shadow(color: Color.green.opacity(glow ? 0.8 : 0.2), radius: glow ? 20 : 5)
                           .frame(width: 250, height: 40)
                       
                       Text("Refresh in \(timeRemaining)")
                           .font(.footnote)
                           .foregroundColor(.gray)
                   }
                   .onAppear {
                       startCountdown()
                       glow = true
                   }
                   
                   Spacer()
               }
               .navigationBarBackButtonHidden(true)
           }
           
           // Helper function to get correct data based on timeframe
    
           private func getDataForSelectedTimeframe() -> ([String], [Double])? {
               switch selectedTimeframe {
               case "Daily":
                   return (dailyDays, dailyPrices[selectedCommodity] ?? [])
               case "Weekly":
                   return (weeklyDays, weeklyPrices[selectedCommodity] ?? [])
               case "Monthly":
                   return (monthlyDays, monthlyPrices[selectedCommodity] ?? [])
               default:
                   return nil
               }
           }
           
           // Countdown to midnight
           private func startCountdown() {
               updateCountdown()
               Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                   updateCountdown()
               }
           }
           
           private func updateCountdown() {
               let now = Date()
               let calendar = Calendar.current
               if let midnight = calendar.date(bySettingHour: 23, minute: 59, second: 59, of: now) {
                   let remaining = Int(midnight.timeIntervalSince(now))
                   let hours = remaining / 3600
                   let minutes = (remaining % 3600) / 60
                   let seconds = remaining % 60
                   timeRemaining = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
               }
        }
}


#Preview {
    PriceComparisonPage()
}
