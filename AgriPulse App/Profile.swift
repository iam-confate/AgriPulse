//
//  Profile.swift
//  AgriPulse App
//
//  Created by Confate Muleya  on 16/10/2025.
//

import SwiftUI

struct Profile: View {
    
    @Environment(\.dismiss) private var dismiss
      @State private var goHome = true
    
      var body: some View {
          ZStack {
              Button(action: {
                  goHome = true
              }) {
                  Image(systemName: "chevron.left")
                      .font(.title2)
                      .foregroundColor(.yellow)
              }
              Color.green
                  .ignoresSafeArea()
              RoundedRectangle(cornerRadius: 30)
                  .fill(.white)
                  .offset(y: 180)
                    Circle()
                        .fill(.white)
                        .frame(width: 150, height: 150)
                        .overlay(
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 75, height: 75)
                                .foregroundStyle(.green)
                        )
                        .offset(y: -280)
              
              
                    
          }
      }
}

#Preview {
    Profile()
}
