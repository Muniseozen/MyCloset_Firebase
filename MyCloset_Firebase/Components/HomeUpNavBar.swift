//
//  HomeUpNavBar.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/29.
//

import SwiftUI

struct NotificationButton: View {
    @Binding var hasNotification: Bool

    var body: some View {
        Button(action: {
            print("Notification tapped")
        }) {
            VStack(alignment: .center) {
                if hasNotification {
                    Image(systemName: "bell.badge")
                        .font(.title3)
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.secondaryMain, .primaryDark)
                       
                } else {
                    Image(systemName: "bell")
                        .foregroundColor(.primaryDark)
                        .font(.title3)
                       
                }
                Text("通知")
                    .font(.custom("Noto Sans JP", size: 9))
                    .foregroundColor(.primaryDark)
            }
        }
    }
}
