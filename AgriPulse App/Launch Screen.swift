//
//  ContentView.swift
//  AgriPulse App
//
//  Created by Confate Muleya  on 15/10/2025.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var scale: CGFloat = 0.5
    
    var body: some View {
        NavigationView {
           
            VStack(alignment: .center) {
                
                Image("AgriPulse.logo")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .scaledToFit()
                    .scaleEffect(scale)
                    .onAppear{
                        withAnimation(.easeOut(duration: 1.5)) {
                            scale = 1.0
                        }
                    }
                
                Text("AgriPulse")
                    .font(.system(size: 40))
                    .font(.headline)
                    .scaledToFit()
                    .scaleEffect(scale)
                    .onAppear{
                        withAnimation(.easeOut(duration: 1.0)) {
                            scale = 1.0
                        }
                    }
                    
                
                Text("Feel the heartbeat of the market.")
                    .font(.system(size: 20))
                    .italic()
                    .padding()
                    .scaledToFit()
                    .scaleEffect(scale)
                    .onAppear{
                        withAnimation(.easeOut(duration: 1.0)) {
                            scale = 1.0
                        }
                    }
                
                NavigationLink{MainTabView()
                    
                } label: {
                    RoundedRectangle(cornerRadius: 40)
                        .offset(x: 58)
                        .frame(width: 200, height: 80)
                        .foregroundColor(.green)
                        .scaledToFit()
                        .scaleEffect(scale)
                        .onAppear{
                            withAnimation(.easeInOut(duration: 1.0)) {
                                scale = 1.0
                            }
                        }
                    
                    Text("Get Started")
                        .font(.system(size: 18))
                        .offset(x: -100)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .scaledToFit()
                        .scaleEffect(scale)
                        .onAppear{
                            withAnimation(.easeOut(duration: 1.0)) {
                                scale = 1.0
                            }
                        }
                }
                    
            }
            .padding()
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    LaunchScreen()
}
