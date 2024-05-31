//
//  profilePictureView.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/23.
//

import SwiftUI

struct profilePictureView: View {
    var name: String           // プロフィール名
      var rating: Int            // 星評価
      var ratingCount: Int       // 評価数
      var profileImageName: String // プロフィール画像名
      
      var body: some View {
          HStack(alignment: .center, spacing: 8) {
              // プロフィール画像を表示するボタン
              Button(action: {}) {
                  Image(profileImageName) // プロフィール画像
                      .resizable() // 画像をリサイズ可能に
                      .aspectRatio(contentMode: .fill) // フレームに合わせて画像を拡大/縮小
                      .frame(width: 50, height: 50) // 固定サイズを指定
                      .clipped() // フレームを超える部分をクリップ
                      .cornerRadius(25) // 画像を円形に
                      .shadow(color: Color.black.opacity(0.25), radius: 2, x: 0, y: 2)
              }
              
              VStack(alignment: .leading, spacing: 4) {
                  // プロフィール名
                  Text(name)
                      .font(Font.custom("Noto Sans JP Bold", size: 16).weight(.bold))
                      .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12)) // テキストの色
                  
                  // 星評価と評価数
                  HStack(spacing: 4) {
                      ForEach(0..<5) { index in
                          Image(systemName: index < rating ? "star.fill" : "star") // 星アイコン
                              .frame(width: 16, height: 16) // 固定サイズを指定
                              .foregroundColor(.yellow)
                      }
                      
                      Text("(\(ratingCount))") // 評価数
                          .font(Font.custom("Noto Sans JP Bold", size: 14))
                          .foregroundColor(.blue) // テキストの色
                  }
              }
              
              Spacer()
              
              // person_plusアイコンのボタン
              Button {
              } label: {
                  Image("person_plus") // "person_plus"という名前の画像を表示
                      .resizable() // 画像をリサイズ可能にする
                      .scaledToFit() // フレームに合わせて拡大/縮小
                      .frame(width: 40, height: 24) // 画像のフレームサイズを幅40、高さ24に設定
                      .padding(10) // アイコン周りに10ポイントのパディングを追加
                      .background(Color.white) // 背景色を白に設定
                      .cornerRadius(5) // 角を5ポイントの丸みにする
                      .shadow(color: Color.black.opacity(0.25), radius: 2, x: 0, y: 2) // 影の効果を追加（黒の不透明度0.25、半径2、x方向0、y方向2）
              }
          }
          .padding(8)
      }
  }

  // プレビュー用の構造体
  struct profilePictureView_Previews: PreviewProvider {
      static var previews: some View {
          profilePictureView(name: "Chisato Rina", rating: 2, ratingCount: 12, profileImageName: "profilePic1")
              .frame(width: 300, height: 100) // プレビューのサイズを設定
              .previewLayout(.sizeThatFits) // プレビューのレイアウトを適切に調整
      }
  }
