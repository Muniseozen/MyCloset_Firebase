//
//  SalesScreen.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/23.
//
import SwiftUI

struct SalesScreen: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("売り上げ")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(12)
                    .font(.custom("Noto Sans JP SemiBold", size: 16))
                    .foregroundColor(.myBlack)
            }
            .background(Color.white) // 白の背景
            .frame(maxWidth: .infinity)

            Divider()

            ScrollView {
                VStack{
                    totalSalesView()
                        .padding(.bottom)
                    VStack(spacing: 8){
                        Text("銀行口座へ振り込み")
                            .font(
                                Font.custom("Noto Sans JP", size: 20)
                                    .weight(.semibold)
                            )
                            .foregroundColor(Color(.myBlack))
                            .frame(maxWidth: .infinity, alignment: .leading) // 左寄せ
                        
                        addBankAccount()
                            .padding(.bottom)
                    }
                    VStack(spacing: 8){
                        Text("キャッシュレスにチャージ")
                            .font(
                                Font.custom("Noto Sans JP", size: 20)
                                    .weight(.semibold)
                            )
                            .foregroundColor(Color(.myBlack))
                            .frame(maxWidth: .infinity, alignment: .leading) // 左寄せ
                        cashlessPayments()
                    }
                    .padding(.bottom)

                }
                .padding()
                VStack(spacing: 0){
                    listView(leadingIcon: "building.columns", text: "銀行口座に振り込みについて", trailingIcon: "chevron.right") {
                        print("銀行口座に振り込みについて clicked")
                    }
                    listView(leadingIcon: "building.columns", text: "銀行口座に振り込みについて", trailingIcon: "chevron.right") {
                        print("銀行口座に振り込みについて clicked")
                    }
                    listView(leadingIcon: "building.columns", text: "銀行口座に振り込みについて", trailingIcon: "chevron.right") {
                        print("銀行口座に振り込みについて clicked")
                    }

                }
                .background(
                    Color.white
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.25), radius: 2.5, x: 0, y: 2)
                )
             
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .background(Color.myExtraLightGray) // スクロールエリアのための薄い灰色の背景
    

        }
        .background(Color.myExtraLightGray) // 全体の背景
        
    }
}

#Preview {
    SalesScreen()
}
