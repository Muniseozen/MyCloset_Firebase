//
//  OnBoardingScreen.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/23.
//

import SwiftUI

// オンボーディングステップのデータモデル
struct OnBoardingStep {
    let image: String  // ステップに表示する画像の名前
    let title: String  // ステップのタイトル
    let description1: String  // ステップの説明文
    let description2: String  // ステップの説明文
}

// オンボーディングステップの配列
private let onBoardingSteps = [
    OnBoardingStep(image: "onBoarding1", title: "Step 1", description1: "まずはアイテムを", description2: "見つける！"),
    OnBoardingStep(image: "onBoarding2", title: "Step 2", description1: "Welcome to the app", description2: "Get started with the app"),
    OnBoardingStep(image: "onBoarding3", title: "Step 3", description1: "Discover new features", description2: "Get started with the app"),
    OnBoardingStep(image: "onBoarding4", title: "Step 4", description1: "Get started with the app", description2: "Get started with the app"),
    OnBoardingStep(image: "onBoarding5", title: "", description1: "Get started with the app", description2: "Get started with the app")
]

// オンボーディング画面のView
struct OnBoardingScreen: View {
    // 現在のステップを追跡するためのState変数
    @State private var currentStep = 0
    
    init() {
        // UIScrollViewの跳ね返りを無効にする
        UIScrollView.appearance().bounces = false
    }

    var body: some View {
        VStack {
            HStack {
                Spacer()
                // スキップボタン
                Button(action: {
                    withAnimation {
                        self.currentStep = onBoardingSteps.count - 1 // 最後のステップにジャンプ
                    }
                }) {
                    Text("スキップ")
                        .font(.custom("Noto Sans JP SemiBold", size: 12))
                        .padding(.horizontal, 12)
                        .foregroundColor(.gray)
                }
            }
            
            // ページング可能なタブビュー
            TabView(selection: $currentStep) {
                ForEach(0..<onBoardingSteps.count, id: \.self) { index in
                    VStack {
                        // タイトル表示
                        Text(onBoardingSteps[index].title)
                            .font(.custom("Noto Sans JP Bold", size: 30))
                            .foregroundColor(.myBlack)
                            .padding()
                        
                        Spacer()
                        // 画像表示
                        Image(onBoardingSteps[index].image)
                            .resizable()
                            .frame(width: 300, height: 300)
                        
                        Spacer()
                        VStack {
                            // 説明文表示1
                            Text(onBoardingSteps[index].description1)
                            
                            // 説明文表示2
                            Text(onBoardingSteps[index].description2)
                        }
                        .multilineTextAlignment(.center)
                        .font(.custom("Noto Sans JP Medium", size: 28))
                        .foregroundColor(.myBlack)
                        .padding()
                        Spacer()
                    }
                    .tag(index)  // 現在のステップのインデックスをタグとして設定
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // インデックス表示を非表示に設定
            
            // ページインジケーター
            HStack {
                ForEach(0..<onBoardingSteps.count, id: \.self) { index in
                    if index == currentStep {
                        Rectangle()
                            .frame(width: 32, height: 6)
                            .cornerRadius(8)
                            .foregroundColor(.primaryMedium)
                    } else {
                        Circle()
                            .frame(width: 6, height: 6)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.bottom, 20)
            
            // 次へボタンまたは今すぐ始めるボタン
            Button(action: {
                // ボタンが押されたときのアクション
                withAnimation {
                    if self.currentStep < onBoardingSteps.count - 1 {
                        //現在のステップがオンボーディングステップの最後でない場合
                        self.currentStep += 1 // 次のステップへ進む
                    } else {
                        SignupView()
                    }
                }
            }) {
                HStack(spacing: 12) {
                    Text(currentStep < onBoardingSteps.count - 1 ? "次へ" : "今すぐ始める！")
                    Image(systemName: "arrow.right")
                }
                .font(.custom("Noto Sans JP Bold", size: 20))
                .padding(16) // ボタン内のテキスト周囲に16ポイントのパディングを追加
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                .background(Color.primaryMain) // ボタンの背景色を設定
                .cornerRadius(50) // ボタンの角を丸める
                .foregroundColor(.white) // テキストの色を白に設定
            }
            // ボタンスタイルをプレーンに設定（デフォルトのボタンスタイルを無効化）
            .buttonStyle(PlainButtonStyle())
        }
        .padding()
    }
}

// プレビュー用のコード
struct OnBoardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingScreen()
    }
}
