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
            VStack {
                
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
                        withAnimation(.easeOut(duration: 2.0)) {
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
                        withAnimation(.easeOut(duration: 2.0)) {
                            scale = 1.0
                        }
                    }
                
                NavigationLink("Get Started"){HomeScreen()}
                    .scaledToFit()
                    .scaleEffect(scale)
                    .onAppear{
                        withAnimation(.easeOut(duration: 2.0)) {
                            scale = 1.0
                        }
                    }
                
                .padding()
                .frame(width: 200, height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.green)
                )
                .foregroundColor(.white)
                .font(.headline)
            }
            .padding()
        }
    }
}

#Preview {
    LaunchScreen()
}
