//
//  TabItems.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/23.
//

import SwiftUI


/// タブアイテムを定義

struct TabItems:View {
    var tint: Color
    var inactivetint: Color
    var tab: Tab
    var animation: Namespace.ID
    @Binding var activeTab: Tab
    
    ///Each Tb Item Position on The Screen
    @State private var tabPosition: CGPoint = .zero
    var body: some View{
        VStack(spacing: 5) {
            /// タブアイコンを表示
            Image(systemName: tab.systemImages)
                .font(.title2)
                .foregroundColor(activeTab == tab ? .white : inactivetint)
            ///Increasing Size For The Active Tab
                .frame( width : activeTab == tab ? 66 : 36,height:activeTab == tab ? 66 : 36 )
                .background{
                    if activeTab == tab {
                        Circle()
                            .fill(tint.gradient)
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)

                                    
                    }
                }
                .padding(.bottom,6)
            ///タブのラベルを表示
            Text(tab.rawValue)
                .font(.caption)
            ///activeTabとtabが等しい場合はtint色を、そうでない場合はdarkGrey色を前景色として設定する
                .foregroundColor(activeTab == tab ? tint : .myDarkGray)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .onTapGesture {
            activeTab = tab
        }
    }
}


