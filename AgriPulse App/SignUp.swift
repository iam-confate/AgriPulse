//
//  SignUp.swift
//  AgriPulse App
//
//  Created by Confate Muleya  on 23/10/2025.
//

import SwiftUI

struct FieldViewSecure: View {
    @ObservedObject private var settings = SettingsManager.shared
    @State private var isSecure = true
    @Binding var text: String
    var placeholder: String = ""

    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecure {
                    SecureField(placeholder, text: $text)
                } else {
                    TextField(placeholder, text: $text)
                }
            
            }
            .padding()
            .background(Color(settings.isDarkMode ? .black : .white))
            .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.green, lineWidth: 4)
                    )
            .padding(.horizontal, 30)
            
            Image(systemName: isSecure ? "eye.slash" : "eye")
                .foregroundColor(.gray)
                .padding(.trailing, 40)
                .onTapGesture {
                    isSecure.toggle()
                }
        }
        .frame(maxWidth: .infinity)
           .padding(.horizontal, -30)
    }
}

struct SignUp: View {
    
    @ObservedObject private var settings = SettingsManager.shared
    @State private var fullName: String = ""
    @State private var username: String = ""
    @State private var emailAddress: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""

    var body: some View {
        NavigationStack {
            ZStack {
                Color.green.ignoresSafeArea()
                
                RoundedRectangle(cornerRadius: 30)
                    .fill(settings.isDarkMode ? .black : .white)
                    .offset(y: 120)
                
                
                VStack(spacing: 10) {
                
                    
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 150, height: 150)
                        .offset(y: -100)
                    
                    Text("SignUp")
                        .font(.largeTitle)
                        .foregroundColor(.green)
                        .fontWeight(.bold)
                        .offset(y: -40)
                    
                    VStack(spacing: 10) {
                        TextField("Full Name", text: $fullName)
                            .padding()
                            .background(Color(settings.isDarkMode ? .black : .white))
                            .cornerRadius(10)
                            .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.green, lineWidth: 4)
                                    )
                            
                        
                        TextField("Username", text: $username)
                            .padding()
                            .background(Color(settings.isDarkMode ? .black : .white))
                            
                            .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.green, lineWidth: 4)
                                    )
                          
                            
                        
                        TextField("Email Address", text: $emailAddress)
                            .padding()
                            .background(Color(settings.isDarkMode ? .black : .white))
                            .cornerRadius(10)
                            .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.green, lineWidth: 4)
                                    )
                            
                        FieldViewSecure(text: $password, placeholder: "Password")
                        FieldViewSecure(text: $confirmPassword, placeholder: "Confirm Password")
                    }
                    .padding(.horizontal, 30)
                    
                    Divider()
                        .opacity(0)
                    Divider()
                        .opacity(0)
                    Divider()
                        .opacity(0)

                    
                    NavigationLink(destination: MainTabView()) {
                               Text("SignUp")
                                   .font(.headline)
                                   .foregroundColor(.white)
                                   .frame(maxWidth: .infinity)
                                   .padding()
                                   .background(Color.green)
                                   .cornerRadius(10)
                           }
                           .padding(.horizontal)
                    
                    
                    HStack {
                        Text("Already have an account?")
                            .foregroundColor(.gray)
                        NavigationLink(destination: LogIn()){
                            Text("Log in")
                                .fontWeight(.semibold)
                                .foregroundColor(.green)
                        }
                    }
                    .padding()
                }
            }
        }
        
    }
}

#Preview {
    SignUp()
}
