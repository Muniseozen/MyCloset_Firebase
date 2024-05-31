//
//  totalSalesView.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/28.
//

import SwiftUI

struct totalSalesView: View {
    var body: some View {
        Button(action: {
            // アクションをここに追加
        }, label: {
            HStack {
                VStack(spacing: 0){
                    Image("wallet")
                    Text("合計売上金")
                        .font(.custom("Noto Sans JP Medium", size: 16))
                        
                      
                }
                .frame(maxWidth: .infinity,alignment: .leading) // 親ビューの幅に合わせる
                Spacer()
                Text("¥")
                    .font(.custom("Noto Sans JP SemiBold", size: 26))
                Text("10,987")
                    .font(.custom("Noto Sans JP Medium", size: 26))
             
                
                Image(systemName: "chevron.right")
                    .font(.title3)
                    .padding(.leading)
            }
            .padding(.horizontal)
            .padding(.vertical)
            .frame(maxWidth: .infinity) // 親ビューの幅に合わせる
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.25), radius: 2.5, x: 0, y: 2)
            .foregroundColor(.myBlack)
            
        })

    }
}

struct totalSalesView_Previews: PreviewProvider {
    static var previews: some View {
        totalSalesView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

