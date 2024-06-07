//
//  SelectProductCondition.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/06/03.
//

import SwiftUI

struct SelectProductCondition: View {
    @State private var selectedText: String?
    
    let texts = ["目だった汚れ無し", "ほぼ未使用", "新品未使用"]
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("商品状態")
                    .font(Font.custom("Noto Sans", size: 18))
                Text("(必須)")
                  .font(Font.custom("Noto Sans", size: 12))
                 
            }
            .padding(.vertical)
            .foregroundColor(Color(red: 0.35, green: 0.35, blue: 0.35))
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(texts, id: \.self) { text in
                        Text(text)
                            .font(Font.custom("Noto Sans", size: 16))
                            .foregroundColor(selectedText == text ? Color.white : Color(red: 0.44, green: 0.44, blue: 0.44))
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                            .background(
                                selectedText == text ? Color.secondaryMedium : Color.clear
                            )
                            .cornerRadius(50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color(red: 0.44, green: 0.44, blue: 0.44), lineWidth: 1.5)
                            )
                            .onTapGesture {
                                selectedText = selectedText == text ? nil : text
                            }
                    }
                }
             
            }
        }
        .padding()
    }
}


#Preview {
    SelectProductCondition()
}
