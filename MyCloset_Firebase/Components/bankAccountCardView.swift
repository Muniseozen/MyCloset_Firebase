//
//  bankAccountCardView.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/28.
//

import SwiftUI

struct bankAccountCardView: View {
    var bankName: String
    var branch: String
    var accountNumber: String
    var fullName: String
    var backgroundColor: Color
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(backgroundColor)
                .cornerRadius(5)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(bankName)
                        .font(.custom("Noto Sans JP Regular", size: 14))
                    Spacer()
                    Image(systemName: "sdcard.fill")
                }
                
                HStack(spacing: 36) {
                    VStack(alignment: .leading) {
                        Text("支店")
                            .font(.custom("Noto Sans JP Regular", size: 10))
                        Text(branch)
                            .font(.custom("Noto Sans JP Regular", size: 14))
                    }
                    VStack(alignment: .leading) {
                        Text("口座番号")
                            .font(.custom("Noto Sans JP Regular", size: 10))
                        Text(accountNumber)
                            .font(.custom("Noto Sans JP Regular", size: 14))
                    }
                }
                
                
                Text(fullName)
                    .font(.custom("Noto Sans JP Regular", size: 14))
            }
            .padding(10)
            .foregroundColor(.white)
        }
        .frame(minWidth: 100, maxWidth: 160, minHeight: 50, maxHeight: 110)
    }
}

#Preview {
    HStack {
        bankAccountCardView(bankName: "三井住友銀行", branch: "234", accountNumber: "1234567", fullName: "MUNISE OZEN", backgroundColor: .blue)
    }
    .padding()
}
