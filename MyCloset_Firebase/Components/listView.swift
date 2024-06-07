//
//  listView.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/29.
//

import SwiftUI

struct listView: View {
    var leadingIcon: String
    var text: String
    var trailingIcon: String
    var action: () -> Void
    
    var body: some View {
        VStack{
            Button(action: action) {
                HStack {
                    Image(systemName: leadingIcon)
                    Text(text)
                    Spacer()
                    Image(systemName: trailingIcon)
                    
                }
                .padding(.horizontal)
                .foregroundColor(.myDarkGray)
              
                .frame(maxWidth: .infinity, minHeight: 48, alignment: .center)
                
            }
 
            .buttonStyle(PlainButtonStyle()) // デフォルトのボタンスタイルを無効にしてリンクのように見せる
        }
        .background(Color.white)
    }
}


#Preview {
    listView(leadingIcon: "building.columns", text: "銀行口座に振り込みについて", trailingIcon: "chevron.right") {
        print("銀行口座に振り込みについて clicked")
    }
}
