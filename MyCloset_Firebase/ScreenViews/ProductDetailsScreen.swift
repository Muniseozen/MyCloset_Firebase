//
//  ProductDetailsScreen.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/23.
//

import SwiftUI

struct ProductDetailsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // ナビゲーションバーの追加
                HStack {
                    upNavBarView(title: "商品詳細")
                }
                
                // プロフィールビュー
                profilePictureView(name: "Munise Ozen", rating: 4, ratingCount: 24, profileImageName: "profilePic1")
                
                ZStack(alignment: .bottom) {
                    Image(.sweatshirt)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: 400)
                        .clipped()
                    
                    HStack(spacing: 4) {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.white.opacity(0.5))
                            .frame(width: 20, height: 6)
                        ForEach(0..<5, id: \.self) { index in
                            
                            Circle()
                                .fill(Color.gray.opacity(0.5))
                                .frame(width: 6, height: 6)
                        }
                    }
                    .padding(.bottom, 10)
                    
                    
                }
                // Like, Comment, 送信ボタン
                          HStack {
                              ZStack {
                                  Button(action: {
                                      // Likeボタンのアクション
                                  }) {
                                      Image(systemName: "heart")
                                          .resizable()
                                          .frame(width: 34, height: 30)
                                          .padding(12)
                                          .foregroundColor(.myDarkGray) // カスタムカラーを使用
                                  }
                                  Text("12")
                                      .font(.custom("Noto Sans JP", size: 10))
                                      .foregroundColor(.black) // テキストの色を設定
                                      .offset(x: 0, y: -2) // テキストを中央に配置するためにオフセットを調整
                              }
                              
                              ZStack {
                                  Button(action: {
                                      // Commentボタンのアクション
                                  }) {
                                      Image(systemName: "bubble.left")
                                          .resizable()
                                          .frame(width: 34, height: 30)
                                          .padding(12)
                                          .foregroundColor(.myDarkGray) // カスタムカラーを使用
                                  }
                                  Text("12")
                                      .font(.custom("Noto Sans JP", size: 10))
                                      .foregroundColor(.black) // テキストの色を設定
                                      .offset(x: 0, y: -4) // テキストを中央に配置するためにオフセットを調整
                              }
                              
                              Spacer()
                              
                              Button(action: {
                                  // 送信ボタンのアクション
                              }) {
                                  Image(systemName: "paperplane")
                                      .resizable()
                                      .frame(width: 30, height: 28)
                                      .padding(12)
                                      .foregroundColor(.myDarkGray) // カスタムカラーを使用
                              }
                          }
 
                          // Dividerを追加して細い線を表示
                          Divider()
                              .background(Color.gray) // 線の色を設定
                      }
            .background(Color.white)
            
            VStack(alignment: .leading) {
                Text("ナイキ メンズスウェットパーカー 黒　\nMサイズ")
                  .font(Font.custom("Noto Sans", size: 18))
                  .foregroundColor(.black)
                Text("NIKE")
                  .font(Font.custom("Noto Sans", size: 14))
                  .foregroundColor(Color(red: 0.16, green: 0.5, blue: 1))
            }
            .frame(maxWidth: .infinity)
            }
        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
        }
    
    }


struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView()
    }
}


