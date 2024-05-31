//
//  addBankAccount.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/28.
//

import SwiftUI

import SwiftUI

struct addBankAccount: View {
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            HStack {
                Text("銀行口座を選択・登録する")
                    .font(.custom("Noto Sans", size: 18).weight(.medium))
                    .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "plus.circle")
                        .font(.title2)
                })
            }
            .frame(maxWidth: .infinity)
            Divider()
                HStack(spacing: 12){
                    bankAccountCardView(bankName: "適当銀行", branch: "123", accountNumber: "1234567", fullName: "MUNISE OZEN", backgroundColor: .primaryMain)
                        
                    
                    bankAccountCardView(bankName: "適当銀行", branch: "123", accountNumber: "1234567", fullName: "MUNISE OZEN", backgroundColor: .secondaryMedium)
                       
                    
                }
                .padding(.vertical)
            lineButtonView(label: "講座に振り込む", backgroundColor: .white, textColor: .primaryMain, borderColor: .primaryMain) {
                //Action code
            }
            }
        .padding(.horizontal)
        .padding(.vertical)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.25), radius: 2.5, x: 0, y: 2)
        }

    }


#Preview {
    addBankAccount()
}
