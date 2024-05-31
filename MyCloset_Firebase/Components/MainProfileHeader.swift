//
//  MainProfileHeader.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/30.
//

import SwiftUI

struct MainProfileHeader: View {
    var name: String
    var rating: Int
    var ratingCount: Int
    var profileImageName: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Image(profileImageName) // Replace with your profile picture asset
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                Spacer()
                HStack(spacing: 16) {
                    VStack {
                        Text("200")
                        Text("出品")
                    }
                    
                    VStack {
                        Text("1.5k")
                        Text("フォロワー")
                    }
                    
                    VStack {
                        Text("180")
                        Text("フォロー中")
                    }
                }
                .font(Font.custom("Noto Sans JP SemiBold", size: 16))
            }
            Text(name)
                .font(Font.custom("Noto Sans JP SemiBold", size: 16))
            // 星評価と評価数
            ratingView(rating: 4, ratingCount: 12)
            
        }
        .padding()
        
    
        
    }
}

struct MainProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        MainProfileHeader(name: "Chisato Rina", rating: 4, ratingCount: 12, profileImageName: "profilePic1")
    }
}
