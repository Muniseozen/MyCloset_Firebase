//
//  Tab.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/28.
//

import SwiftUI

/// App Tab's
enum Tab: String, CaseIterable {
    // Define the five tabs for the app: Home, Sale, Add Product, Coupon, Profile
    case home = "ホーム"
    case sale = "売上"
    case addproduct = "出品"
    case coupon = "クーポン"
    case profile = "My Closet"
    
    // Return the system image name corresponding to each tab
    var systemImages: String {
        switch self {
        case .home:
            return "storefront"
        case .sale:
            return "dollarsign.circle" // Replace with icon name set in Assets catalog
        case .addproduct:
            return "camera" // Replace with icon name set in Assets catalog
        case .coupon:
            return "ticket" // Replace with icon name set in Assets catalog
        case .profile:
            return "person" // Replace with icon name set in Assets catalog
        }
    }
    
    // Return the index of the tab
    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}

/// Define tab items

struct TabItems: View {
    var tint: Color
    var inactivetint: Color
    var tab: Tab
    var animation: Namespace.ID
    @Binding var activeTab: Tab
    
    /// Each Tab Item Position on The Screen
    @State private var tabPosition: CGPoint = .zero
    
    var body: some View {
        VStack(spacing: 5) {
            /// Display tab icon
            Image(systemName: tab.systemImages)
                .font(.title2)
                .foregroundColor(activeTab == tab ? .white : inactivetint)
                /// Increasing Size For The Active Tab
                .frame(width: activeTab == tab ? 60 : 40, height: activeTab == tab ? 60 : 40)
                .background {
                    if activeTab == tab {
                        Circle()
                            .fill(tint.gradient)
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                    }
                }
                .padding(.bottom, 6)
            /// Display tab label
            Text(tab.rawValue)
                .font(.caption)
                .foregroundColor(activeTab == tab ? tint : .myDarkGray)
        }
        .frame(maxWidth: .infinity)
 
        .onTapGesture {
            activeTab = tab
        }
    }
}

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
        .background {
            Rectangle()
                .fill(Color.white)
                .cornerRadius(25)
                .ignoresSafeArea(edges: .bottom) // Ensure the background extends to the safe area
                .shadow(radius: 5)
        }
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: activeTab)
    }
}


#Preview{
    ContentView()
}
