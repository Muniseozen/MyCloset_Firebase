//
//  HomeCategoryLinkView.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/30.
//

import SwiftUI

struct HomeCategoryLinkView: View {
    // メモ: カテゴリーと商品の定義
    let categories = [
        "カテゴリー1", "カテゴリー2", "カテゴリー3", "カテゴリー4", "カテゴリー5"
    ]

    let products = [
        "カテゴリー1": ["商品1", "商品2", "商品3"],
        "カテゴリー2": ["商品4", "商品5"],
        "カテゴリー3": ["商品6", "商品7", "商品8"],
        "カテゴリー4": ["商品9"],
        "カテゴリー5": ["商品10", "商品11"]
    ]

    var body: some View {
        NavigationStack {
            VStack {
                // カテゴリーを表示するための水平スクロールビュー
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(categories, id: \.self) { category in
                            NavigationLink(value: category) {
                                VStack {
                                    // カテゴリー画像を表示
                                    if let image = UIImage(named: "\(category.lowercased()).jpg") {
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 60, height: 60)
                                            .clipShape(Circle())
                                    } else {
                                        Circle()
                                            .fill(Color.gray)
                                            .frame(width: 60, height: 60)
                                            .overlay(
                                                Text("?")
                                                    .foregroundColor(.white)
                                                    .font(.largeTitle)
                                            )
                                    }
                                    Text(category) // カテゴリー名を表示
                                        .font(.caption)
                                        .foregroundColor(.primary)
                                }
                                .padding(.horizontal, 8) // 水平方向のパディングを追加
                            }
                        }
                    }
                    .padding() // HStackの周りにパディングを追加
                }
            
            }
        }
    }
}

struct ProductListView: View {
    let products: [String]
    let categoryName: String

    var body: some View {
        List(products, id: \.self) { product in
            Text(product)
        }
        .navigationTitle(categoryName)
    }
}

struct HomeCategoryLinkView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCategoryLinkView()
    }
}

