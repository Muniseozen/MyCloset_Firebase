//
//  LoginView.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/28.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var navigateToHome = false
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack {
                    // Background Circles
                    Circle()
                        .fill(Color.primaryMain)
                        .frame(width: min(geometry.size.width, geometry.size.height) * 0.5, height: min(geometry.size.width, geometry.size.height) * 0.5)
                        .offset(x: geometry.size.width * -0.3, y: geometry.size.height * -0.6)
                    
                    Circle()
                        .fill(Color.secondaryMain)
                        .frame(width: min(geometry.size.width, geometry.size.height) * 0.3, height: min(geometry.size.width, geometry.size.height) * 0.3)
                        .offset(x: geometry.size.width * -0.5, y: geometry.size.height * -0.5)
                    
                    VStack {
                        // Image
                        Image("logoWhite")
                            .resizable()
                            .scaledToFit()
                            .frame(width: min(geometry.size.width, geometry.size.height) * 0.6, height: min(geometry.size.width, geometry.size.height) * 0.6)
                        
                        Text("ログイン")
                            .font(.custom("Noto Sans JP Bold", size: 24))
                            .foregroundColor(Color.primaryMain)
                            .frame(maxWidth: .infinity, alignment: .leading)
                     
                        
                        Spacer()
                        
                        // Form Fields
                        VStack(spacing: 12) {
                            authInputView(text: $email,
                                          title: "メールアドレス",
                                          placeholder: "メールアドレス")
                                .autocapitalization(.none)
                            
                            authInputView(text: $password,
                                          title: "パスワード",
                                          placeholder: "パスワード",
                                          isSecureField: true)
                        }
                        
                        // Forgot Password
                        NavigationLink(destination: ForgotPasswordView()) {
                            Text("パスワードお忘れの方")
                                .font(.custom("Noto Sans JP", size: 12))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .foregroundColor(Color.primaryLight)
                        }
                        
                        // Login Button
                        Button {
                            navigateToHome = true
                        } label: {
                            HStack(spacing: 12) {
                                Text("ログイン")
                                    .fontWeight(.bold)
                                
                                Image(systemName: "arrow.right")
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 48)
                        }
                        .background(Color.primaryMain)
                        .cornerRadius(50)
                        
                        NavigationLink(destination: HomeScreen(), isActive: $navigateToHome) {
                            EmptyView()
                        }
          
                        
                        Spacer()
                        Text("または")
                        Spacer()
                        
                        // Social Login Buttons
                        HStack(spacing: 16) {
                            Button(action: {
                                // Handle Google login
                            }) {
                                Image("googleIcon")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                            
                            Button(action: {
                                // Handle Facebook login
                            }) {
                                Image("facebookIcon")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                            
                            Button(action: {
                                // Handle Twitter login
                            }) {
                                Image("xIcon")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                            
                            Button(action: {
                                // Handle Apple login
                            }) {
                                Image("appleIcon")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                        }
                        Spacer()
                        
                        // SignUp Button
                        NavigationLink {
                            SignupView()
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            HStack(spacing: 4) {
                                Text("アカウントお持ちでないですか？")
                                Text("サインアップ")
                                    .fontWeight(.bold)
                            }
                            .font(.system(size: 12))
                        }
                        
                    }
                    
                }
                .padding()
                
            }
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

