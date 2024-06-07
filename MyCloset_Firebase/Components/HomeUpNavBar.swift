//
//  HomeUpNavBar.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/29.
//

import SwiftUI

struct HomeUpNavBar: View {
    @Binding var hasNotification: Bool
    
    var body: some View {
        HStack {
            // Search Button
            Button(action: {
                print("Search tapped")
            }) {
                VStack(alignment: .center) {
                    Image(systemName: "waveform.badge.magnifyingglass")
                        .font(.title2)
                        .padding(2)
                    Text("検索する")
                        .font(.custom("Noto Sans JP", size: 9))
                }
            }
            .foregroundColor(.primaryDark)

            Spacer()

            // Liked Button
            Button(action: {
                print("Favorite tapped")
            }) {
                VStack(alignment: .center) {
                    Image(systemName: "heart")
                        .font(.title2)
                        .padding(2)
                    Text("お気に入り")
                        .font(.custom("Noto Sans JP", size: 9))
                }
            }
            .foregroundColor(.primaryDark)

            // Notification Button
            Button(action: {
                print("Notification tapped")
            }) {
                VStack(alignment: .center) {
                    if hasNotification {
                        Image(systemName: "bell.badge")
                            .font(.title2)
                          
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.secondaryMain, .primaryDark)
                    } else {
                        Image(systemName: "bell")
                            .foregroundColor(.primaryDark)
                            .font(.title2)
                            .padding(2)
                            
                    }
                    Text("通知")
                        .font(.custom("Noto Sans JP", size: 9))
                        .foregroundColor(.primaryDark)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(5) // Optional: to give rounded corners to the background
        .shadow(color: .black.opacity(0.25), radius: 2.5, x: 0, y: 4) // Apply shadow to the container
    }
}


struct NotificationButton: View {
    @Binding var hasNotification: Bool

    var body: some View {
        Button(action: {
            print("Notification tapped")
        }) {
            VStack(alignment: .center) {
                Image(systemName: "bell")
                    .font(.title3)
                Text("通知")
                    .font(.custom("Noto Sans JP", size: 9))
            }
        }
        .foregroundColor(hasNotification ? .red : .primary)
    }
}

struct HomeUpNavBar_Previews: PreviewProvider {
    @State static var hasNotification = true
    
    static var previews: some View {
        HomeUpNavBar(hasNotification: $hasNotification)
    }
}
