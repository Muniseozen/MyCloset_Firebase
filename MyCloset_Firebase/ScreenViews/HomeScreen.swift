//
//  HomeScreen.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/23.
//

import SwiftUI

enum FilterType: Equatable {
    case new
    case recommended
}

struct HomeScreen: View {
    @State static var hasNotification = true
    @State private var selectedCategory: String? = nil
    @State private var selectedFilter: FilterType = .new
    private let newProducts = ["Product 1", "Product 2", "Product 3"]
    private let recommendedProducts = ["Recommended Product 1", "Recommended Product 2", "Recommended Product 3"]
    
    let categories = [
        "カテゴリー1", "カテゴリー2", "カテゴリー3", "カテゴリー4", "カテゴリー5",
        "カテゴリー6", "カテゴリー7", "カテゴリー8", "カテゴリー9", "カテゴリー10",
        "カテゴリー11", "カテゴリー12", "カテゴリー13", "カテゴリー14", "カテゴリー15",
        "カテゴリー16", "カテゴリー17", "カテゴリー18", "カテゴリー19", "カテゴリー20"
    ]

    let products = [
        "カテゴリー1": ["商品1", "商品2", "商品3"],
        "カテゴリー2": ["商品4", "商品5"],
        "カテゴリー3": ["商品6", "商品7", "商品8"],
        "カテゴリー4": ["商品9"],
        "カテゴリー5": ["商品10", "商品11"],
        "カテゴリー6": ["商品12"],
        "カテゴリー7": ["商品13", "商品14"],
        "カテゴリー8": ["商品15"],
        "カテゴリー9": ["商品16", "商品17", "商品18"],
        "カテゴリー10": ["商品19"],
        "カテゴリー11": ["商品20", "商品21"],
        "カテゴリー12": ["商品22", "商品23", "商品24"],
        "カテゴリー13": ["商品25"],
        "カテゴリー14": ["商品26", "商品27"],
        "カテゴリー15": ["商品28", "商品29"],
        "カテゴリー16": ["商品30", "商品31"],
        "カテゴリー17": ["商品32"],
        "カテゴリー18": ["商品33", "商品34", "商品35"],
        "カテゴリー19": ["商品36"],
        "カテゴリー20": ["商品37", "商品38"]
    ]

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // UpNavBarView
                HomeUpNavBar(hasNotification: HomeScreen.$hasNotification)
                Divider()

                // Switch Button View
                HStack(spacing: 0) {
                    Button(action: {
                        selectedFilter = .new
                        selectedCategory = nil
                    }) {
                        Text("NEW")
                            .font(selectedFilter == .new ? Font.custom("Noto Sans JP Bold", size: 18) : Font.custom("Noto Sans JP Regular", size: 16))
                            .frame(maxWidth: .infinity, maxHeight: 24)
                            .padding()
                            .background(selectedFilter == .new ? Color.white : Color.myLightGray)
                            .foregroundColor(selectedFilter == .new ? Color.secondaryMedium : Color.myGray)
                            .cornerRadius(selectedFilter == .new ? 0 : 20, corners: [.bottomRight])
                    }
                    Button(action: {
                        selectedFilter = .recommended
                        selectedCategory = nil
                    }) {
                        Text("おすすめ")
                            .font(selectedFilter == .recommended ? Font.custom("Noto Sans JP Bold", size: 18) : Font.custom("Noto Sans JP Regular", size: 16))
                            .frame(maxWidth: .infinity, maxHeight: 24)
                            .padding()
                            .background(selectedFilter == .recommended ? Color.white : Color.myLightGray)
                            .foregroundColor(selectedFilter == .new ? .myGray : Color.secondaryMedium)
                            .cornerRadius(selectedFilter == .new ? 20 : 0, corners: [.bottomLeft])
                    }
                }
                
                // Category Link View
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(categories, id: \.self) { category in
                            Button(action: {
                                selectedCategory = category
                            }) {
                                VStack (spacing: 8){
                                    Image(uiImage: loadImage(named: category.lowercased()))
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 60)
                                        .clipShape(Circle())
                                                                                
                                    Text(category)
                                        .font(.caption)
                                        .foregroundColor(.primary)
                                }
                                .padding(.horizontal, 8)
                            }
                        }
                    }
                    .padding()
                }

                // Product List View
                ScrollView {
                    VStack {
                        if let category = selectedCategory {
                            Text("\(selectedFilterText()) \(category)")
                                .font(.headline)
                                .padding()
                        }
                        ForEach(getProducts(), id: \.self) { product in
                            Text(product)
                                .padding()
                                .background(Color(UIColor.systemBackground))
                                .cornerRadius(10)
                                .shadow(radius: 2)
                                .padding(.horizontal)
                        }
                    }
                    .padding()
                }
            }
        }
    }

    func getProducts() -> [String] {
        let allProducts: [String]
        switch selectedFilter {
        case .new:
            allProducts = newProducts
        case .recommended:
            allProducts = recommendedProducts
        }
        
        if let category = selectedCategory {
            return products[category]?.filter { allProducts.contains($0) } ?? []
        } else {
            return allProducts
        }
    }

    func loadImage(named: String) -> UIImage {
        return UIImage(named: "\(named).jpg") ?? UIImage(systemName: "photo.circle")!
    }

    func selectedFilterText() -> String {
        switch selectedFilter {
        case .new:
            return "NEW"
        case .recommended:
            return "おすすめ"
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
