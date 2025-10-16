//
//  HomeScreen.swift
//  AgriPulse App
//
//  Created by Confate Muleya  on 15/10/2025.
//

import SwiftUI

struct HomeScreen: View {
   
        //MARK:- Markets
        
        @State private var selectedMarket: String = "Victoria Falls"
           let markets = ["Victoria Falls", "Bulawayo", "Harare"]
           
        //MARK:- Date feature
        
           var formattedDate: String {
               let formatter = DateFormatter()
               formatter.dateStyle = .full
               return formatter.string(from: Date())
           }

        var body: some View {
            NavigationView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    //MARK:- Navigation Title
                    
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
                    
                    //MARK:- Market picker
                    
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
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    
                    //MARK:- Price List
                    
                    List {
                            HStack {
                                Text("Commodity")
                                    .font(.headline)
                                Spacer()
                                Text("USD")
                                    .font(.headline)
                            }
                            HStack {
                                Text("Cattle")
                                Spacer()
                                Text("400.00")
                            }
                        HStack {
                            Text("Sheep")
                            Spacer()
                            Text("40.00")
                        }
                            HStack {
                                Text("Maize")
                                Spacer()
                                Text("60.00")
                            }
                            HStack {
                                Text("Soghurm")
                                Spacer()
                                Text("75.00")
                            }
                            HStack {
                                Text("Tomato")
                                Spacer()
                                Text("20.00")
                            }
                            HStack {
                                Text("Watermelon")
                                Spacer()
                                Text("30.00")
                            }
                        HStack {
                            Text("Manure")
                            Spacer()
                            Text("15.00")
                        }
                        HStack {
                            Text("Hay")
                            Spacer()
                            Text("10.00")
                        }
                        
                        }
                    .listStyle(.plain)
                
                    
                    //MARK:- Compare button
                    
                    NavigationLink {PriceComparisonPage()
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
                                .foregroundStyle(Color.white)
                        }
                    }
                    .buttonStyle(.plain)
                    .padding(.horizontal)
                    
                    Spacer()
                    
            
                        .navigationBarHidden(true)
                }
            }
        }
    }

#Preview {
    HomeScreen()
}
