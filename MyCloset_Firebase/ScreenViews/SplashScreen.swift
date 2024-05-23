//
//  SplashScreen.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/23.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        GeometryReader { geometry in
                 ZStack {
                     // 左上の円
                     Circle()
                         .fill(Color.primaryMain)
                         .frame(width: geometry.size.width * 1, height: geometry.size.width * 1) // 2倍のサイズ
                         .offset(x: -geometry.size.width * 0.3, y: -geometry.size.height * 0.6)
                     
                     // 右上の円
                     Circle()
                         .fill(Color.secondaryMain)
                         .frame(width: geometry.size.width * 0.8, height: geometry.size.width * 0.8) // 2倍のサイズ
                         .offset(x: geometry.size.width * 0.4, y: -geometry.size.height * 0.6)
                     
                     // 左下の円
                     Circle()
                         .fill(Color.secondaryMain)
                         .frame(width: geometry.size.width * 1.1, height: geometry.size.width * 1.1) // 2倍のサイズ
                         .offset(x: -geometry.size.width * 0.25, y: geometry.size.height * 0.7)
                     
                     // 右下の円
                     Circle()
                         .fill(Color.primaryMain)
                         .frame(width: geometry.size.width * 0.7, height: geometry.size.width * 0.7) // 2倍のサイズ
                         .offset(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5)
                     
                     // 中央にアイコンを表示
                     Image(.logoWhite)
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(width: geometry.size.width * 0.8, height: geometry.size.width * 0.8)
                         .foregroundColor(.white)
                         .position(x: geometry.size.width / 2, y: geometry.size.height / 2) // 中央に配置
                 }
             }
        .background(Color.white) // 背景色を設定
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
