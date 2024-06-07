//
//  ContentView.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/23.
//
import SwiftUI

struct ContentView: View {
    @State private var activeTab: Tab = .home
    @Namespace private var animation
    @State private var tabShapePosition: CGPoint = .zero
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $activeTab) {
                HomeScreen()
                    .tag(Tab.home)
                    .toolbar(.hidden, for: .tabBar)
                
                SalesScreen()
                    .tag(Tab.sale)
                    .toolbar(.hidden, for: .tabBar)
                
                AddProductScreen()
                    .tag(Tab.addproduct)
                    .toolbar(.hidden, for: .tabBar)
                
                CouponScreen()
                    .tag(Tab.coupon)
                    .toolbar(.hidden, for: .tabBar)
                
                ProfileScreen()
                    .tag(Tab.profile)
                    .toolbar(.hidden, for: .tabBar)
            }
            CustomTabBar(activeTab: $activeTab)
            
        }
      
    }
}

    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
          
    }
}
