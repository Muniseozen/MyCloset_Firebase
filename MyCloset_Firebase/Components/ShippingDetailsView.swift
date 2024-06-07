//
//  ShippingDetailsView.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/06/03.
//

import SwiftUI

struct ShippingDetailsView: View {
    @State private var selectedShippingOption = 0
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("発送料負担")
                .font(Font.custom("Noto Sans JP Bold", size: 18))
                .foregroundColor(.myDarkGray)
            RadioButton(
                id: 0,
                label: "発送込み（出品者負担）",
                isSelected: $selectedShippingOption,
                textSize: 16
            )
            RadioButton(
                id: 1,
                label: "着払い（購入者負担）",
                isSelected: $selectedShippingOption,
                textSize: 16
            )
            Divider()
            VStack(spacing: 0){
                SelectLinkView(text: "発送放送", detail: "お任せ発送") {
                    //Action
                }
                Divider()
                SelectLinkView(text: "発送元の地域", detail: "") {
                    //Action
                }
                Divider()
                SelectLinkView(text: "発送までの日数", detail: "2日〜3日") {
                    //Action
                }
                Divider()
            }
        }
       
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 0)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            
        }
        
    }


struct RadioButton: View {
    let id: Int
    let label: String
    @Binding var isSelected: Int
    let textSize: CGFloat

    var body: some View {
        Button(action: {
            self.isSelected = self.id
        }) {
            HStack(alignment: .center) {
                Image(systemName: self.isSelected == self.id ? "largecircle.fill.circle" : "circle")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundColor(self.isSelected == self.id ? Color.blue : Color.gray)
                Text(label)
                    .font(Font.system(size: textSize))
                    .foregroundColor(Color.black)
            }
        }
        .foregroundColor(Color.white)
    }
}

#Preview {
    ShippingDetailsView()
}
