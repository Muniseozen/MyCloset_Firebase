//
//  Tab.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/28.
//

import SwiftUI

///App Tab's
enum Tab:String,CaseIterable{
    // ホームページ、セール、商品追加、クーポン、プロフィールの5つのタブを定義
    case home = "ホーム"
    case sale = "売上"
    case addproduct = "出品"
    case coupon = "クーポン"
    case profile = "My Closet"
    
    // 各タブに対応するシステムイメージ名を返すプロパティ
    var systemImages: String {
        switch self {
        case .home:
            return "storefront"
        case .sale:
            return "dollarsign.circle" // Assetsカタログで設定したアイコン名に置き換える
        case .addproduct:
            return "camera" // Assetsカタログで設定したアイコン名に置き換える
        case .coupon:
            return "ticket" // Assetsカタログで設定したアイコン名に置き換える
        case .profile:
            return "person" // Assetsカタログで設定したアイコン名に置き換える
        }
    }
    // タブのインデックスを返すプロパティ
    var index : Int{
        
        // タブが配列内での位置を返す
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}
