//
//  CustomTabBar.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/29.
//

import SwiftUI

import SwiftUI

struct CustomTabBar: View {
    @Binding var activeTab: Tab
    var tint: Color = .primaryMain
    var inactiveTint: Color = .myDarkGray
    @Namespace private var animation
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                TabItems(tint: tint,
                         inactivetint: inactiveTint,
                         tab: tab,
                         animation: animation,
                         activeTab: $activeTab)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(content: {
            Rectangle()
                .fill(Color.white)
                .cornerRadius(25)
                .ignoresSafeArea()
                .shadow(color: Color.myGray.opacity(0.2), radius: 5, x: 0, y: -5)
                .blur(radius: 2)
                .padding(.top, 25)
        })
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: activeTab)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    @State static var activeTab: Tab = .home
    
    static var previews: some View {
        CustomTabBar(activeTab: $activeTab)
    }
}

