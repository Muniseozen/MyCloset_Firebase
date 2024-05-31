//
//  SettingsScreen.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/30.
//

import SwiftUI

struct SettingsScreen: View {
    var body: some View {
      
                    List {
                        Section {
                            HStack(spacing: 20) {
                                Text("MO")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .frame(width: 72, height: 72)
                                    .background(Color.primary)
                                    .clipShape(Circle())
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Munise Ozen")
                                        .fontWeight(.semibold)
                                        .padding(.top, 4)
                                    
                                    Text("munise@gmail.com")
                                        .font(.footnote)
                                        .accentColor(.gray)
                                }
                            }
                        }
                        Section("General") {
                            HStack {
                                settingsRowView(imageName: "gear", title: "Version", tintcolor: .gray)
                                
                                Spacer()
                                Text("1.0.0")
                            }
                        }
                        Section("Account") {
                            Button {
                                Task {
        
                                }
                            } label: {
                                settingsRowView(imageName: "arrow.left.circle.fill", title: "サインアウト", tintcolor: .blue)
                            }
                                
                            Button {
                                Task {
                                    do {
                                     
                                    } catch {
                                        print("Failed delete: \(error.localizedDescription)")
                                    }
                                }
                            } label: {
                                settingsRowView(imageName: "xmark.circle.fill", title: "アカウント削除", tintcolor: .red)
                            }
                        }
                    }
                }
            
        }
#Preview {
    SettingsScreen()
}
