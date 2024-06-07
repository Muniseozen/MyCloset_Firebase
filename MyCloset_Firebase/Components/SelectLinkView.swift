//
//  SelectLinkView.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/06/03.
//

import SwiftUI

struct SelectLinkView: View {
    var text: String
    var detail: String
    var action: () -> Void
    
    var body: some View {
        VStack{
            Button(action: action) {
                HStack {
                    Text(text)
                        .font(Font.custom("Noto Sans JP Bold", size: 18))
                    Spacer()
                    Text(detail)
                    
                    Image(systemName: "chevron.right")
                    
                }
                .foregroundColor(.myDarkGray)
                .frame(maxWidth: .infinity, minHeight: 48, alignment: .center)
                
            }
 
            .buttonStyle(PlainButtonStyle()) // デフォルトのボタンスタイルを無効にしてリンクのように見せる
        }
        .background(Color.white)
    }
}

#Preview {
    SelectLinkView(text: "リンクから選択", detail: "選択結果") {
        
    }
}
