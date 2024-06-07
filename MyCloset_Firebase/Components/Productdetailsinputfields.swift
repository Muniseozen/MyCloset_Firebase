//
//  Productdetailsinputfields.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/31.
//

import SwiftUI


struct ProductDetailsInputFields: View {
    var title: String
    var placeholder: String
    @Binding var text: String
    var characterLimit: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .padding(.bottom, 2)
                .font(Font.custom("Noto Sans JP", size: 18))
                .foregroundColor(Color(red: 0.35, green: 0.35, blue: 0.35))

            TextField(placeholder, text: $text,axis: .vertical)
                .font(Font.custom("Noto Sans JP", size: 16))
                .padding(10)
                .background(Color.white)
                .cornerRadius(10)
                .frame(alignment: .leading)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.44, green: 0.44, blue: 0.44), lineWidth: 1)
                )
                .onChange(of: text) { newValue in
                    if newValue.count > characterLimit {
                        text = String(newValue.prefix(characterLimit))
                    }
                }

            HStack {
                Spacer()
                Text("\(text.count)/\(characterLimit)")
                    .font(Font.custom("Noto Sans JP", size: 12))
                    .foregroundColor(Color.gray)
                    .padding(.top, 2)
            }
   
        }

    }
}

struct ProductDetailsInputFields_Previews: PreviewProvider {
    @State static var productName: String = ""
    @State static var productDetail: String = ""

    static var previews: some View {
        VStack {
            ProductDetailsInputFields(title: "商品名", placeholder: "帽子", text: $productName, characterLimit: 40)
            ProductDetailsInputFields(title: "商品詳細", placeholder: "詳細を入力してください", text: $productDetail, characterLimit: 1000)
        }
        .padding()
    }
}
