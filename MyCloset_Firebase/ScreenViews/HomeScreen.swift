//
//  HomeScreen.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/23.
//

import SwiftUI

struct HomeScreen: View {
    @State private var hasNotification = true
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(0..<5) { _ in // Adjust the range as needed
                        productView()
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            print("Search tapped")
                        }) {
                            VStack(alignment: .center) {
                                Image(systemName: "waveform.badge.magnifyingglass")
                                    .font(.title3)
                                Text("検索する")
                                    .font(.custom("Noto Sans JP", size: 9))
                            }
                        }
                        .foregroundColor(.primaryDark)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            Button(action: {
                                print("Favorite tapped")
                            }) {
                                VStack(alignment: .center) {
                                    Image(systemName: "heart")
                                        .font(.title3)
                                    Text("お気に入り")
                                        .font(.custom("Noto Sans JP", size: 9))
                                }
                            }
                         
                            .foregroundColor(.primaryDark)
                            NotificationButton(hasNotification: $hasNotification)
                        }
                      
                    }
                    
                }
            }
            .padding()
        }
      
    }
}


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
