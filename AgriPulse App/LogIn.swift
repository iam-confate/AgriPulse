//
//  LogIn.swift
//  AgriPulse App
//
//  Created by Confate Muleya  on 23/10/2025.
//

import SwiftUI

struct SecureFieldView: View {
    
    @State private var isSecure = true
    @Binding var text: String
    
    var body: some View {
        ZStack(alignment: .trailing) {
            if isSecure {
                SecureField("Password", text: $text)
                    .textFieldStyle(.roundedBorder)
                    .border(Color.green, width: 2)
            } else {
                TextField("Password", text: $text)
                    .textFieldStyle(.roundedBorder)
                    .border(Color.green, width: 2)
            }
            
            Image(systemName: isSecure ? "eye.slash" : "eye")
                .foregroundColor(.gray)
                .padding(.trailing, 10)
                .onTapGesture {
                    isSecure.toggle()
                }
        }
    }
}

struct LogIn: View {
    @ObservedObject private var settings = SettingsManager.shared
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.green.ignoresSafeArea()
                
                RoundedRectangle(cornerRadius: 30)
                    .fill(settings.isDarkMode ? .black : .white)
                    .offset(y: 120)
                
                VStack() {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 150, height: 150)
                        .offset(y: -75)
                    
                    Text("Login")
                        .font(.largeTitle)
    
                        .foregroundStyle(.green)
                        .fontWeight(.bold)
                    
                    VStack(spacing: 15) {
                        TextField("Enter your email", text: $email)
                            .textFieldStyle(.roundedBorder)
                            .border(Color.green, width: 2)
                        
                        
                        SecureFieldView(text: $password)
                        Button("Forgot Password?") {
                            print("Forgot Password tapped!")
                        }
                        .font(.subheadline)
                        .padding(.top, 5)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.green)
                    }
                    .padding()
                    
                    Spacer()
                    
                    NavigationLink(destination: MainTabView()) {
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    
                    
                    HStack {
                        Text("Don’t have an account?")
                            .foregroundColor(.gray)
                        NavigationLink(destination: SignUp()){
                            Text("Sign Up")
                                .fontWeight(.semibold)
                                .foregroundColor(.green)
                        }
                    }
                    .padding(.top, 10)
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}
  

#Preview {
    LogIn()
}
