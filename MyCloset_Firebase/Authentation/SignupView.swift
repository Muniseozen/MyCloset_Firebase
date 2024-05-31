//
//  SignupView.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/28.
//

import SwiftUI

struct SignupView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack {
                    // Background Circle
                    Circle()
                        .fill(Color.primaryMain)
                        .frame(width: geometry.size.width * 0.5, height: geometry.size.width * 0.5) // 2倍のサイズ
                        .offset(x: -geometry.size.width * -0.3, y: -geometry.size.height * 0.6)
                    Circle()
                        .fill(Color.secondaryMain)
                        .frame(width: geometry.size.width * 0.3, height: geometry.size.width * 0.3) // 2倍のサイズ
                        .offset(x: -geometry.size.width * -0.5, y: -geometry.size.height * 0.5)
                    
                    VStack {
                        // Image
                        Image(.logoWhite) // Use your custom image here
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.22)
                            .padding(.vertical, 32)
                        
                        // Form Fields
                        VStack(spacing: 20) {
                            authInputView(text: $email,
                                          title: "メールアドレス",
                                          placeholder: "example@gmail.com")
                                .autocapitalization(.none)
                            
                            authInputView(text: $username,
                                          title: "ユーザーネーム",
                                          placeholder: "ユーザーネームを入力")
                            
                            authInputView(text: $password,
                                          title: "パスワード",
                                          placeholder: "パスワードを入力",
                                          isSecureField: true)
                            
                            ZStack(alignment: .trailing) {
                                authInputView(text: $confirmPassword,
                                              title: "パスワード",
                                              placeholder: "パスワードを再度入力",
                                              isSecureField: true)
                                
                                if !password.isEmpty && confirmPassword.isEmpty {
                                    if password == confirmPassword {
                                        Image(systemName: "checkmark.circle.fill")
                                            .imageScale(.large)
                                            .fontWeight(.bold)
                                            .foregroundColor(.green)
                                    } else {
                                        Image(systemName: "xmark.circle.fill")
                                            .imageScale(.large)
                                            .fontWeight(.bold)
                                            .foregroundColor(.red)
                                    }
                                }
                            }
                            
                            // SignUp Button
                            Button {
                                Task {
                                    // try await viewModel.createUser(withEmail: email, password: password, username: username)
                                }
                            } label: {
                                HStack(spacing: 12) {
                                    Text("サインアップ")
                                        .fontWeight(.bold)
                                    Image(systemName: "arrow.right")
                                }
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width - 32, height: 42)
                            }
                            .background(Color.primaryMain)
                            .cornerRadius(50)
                            .padding(.top, 24)
                            
                            Spacer()
                            
                            // Login Button
                            Button {
                                dismiss()
                            } label: {
                                HStack(spacing: 4) {
                                    Text("アカウントお持ちですか？")
                                    Text("ログイン")
                                        .fontWeight(.bold)
                                }
                                .font(.system(size: 12))
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 12)
                    }
                }
            }
        }
    }
}



struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
