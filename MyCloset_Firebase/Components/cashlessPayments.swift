//
//  cashlessPayments.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/29.
//

import SwiftUI

// Helper extension to chunk an array into smaller arrays of a specified size
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        var chunks: [[Element]] = []
        for index in stride(from: 0, to: self.count, by: size) {
            let chunk = Array(self[index..<Swift.min(index + size, self.count)])
            chunks.append(chunk)
        }
        return chunks
    }
}

struct cashlessPayments: View {
    @State private var selectedPayment: String?
    private let paymentMethods = ["payPay", "linePay", "payPal", "rakutenPay", "suica", "pasmo"]
    
    var body: some View {
        VStack(spacing: 12) {
            Text("キャッシュレス経済を選択する")
                .font(.custom("Noto Sans", size: 18).weight(.medium))
                .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            VStack(alignment: .leading, spacing: 12) {
                 ForEach(paymentMethods.chunked(into: 4), id: \.self) { row in
                     HStack {
                         ForEach(row, id: \.self) { paymentMethod in
                             paymentButton(imageName: paymentMethod)
                         }
                     }
                 }
             }
            .frame(width: .infinity)
            .padding(.top)
            
            lineButtonView(
                label: "チャージする",
                backgroundColor: .white,
                textColor: .secondaryMain,
                borderColor: .secondaryMain,
                action: {
                    if let payment = selectedPayment {
                        print("Navigating to \(payment) charge page")
                        // Navigation logic here, e.g., open a URL or navigate to another view
                    } else {
                        print("No payment method selected")
                    }
                }
            )
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.25), radius: 2.5, x: 0, y: 2)
    }
    
    func paymentButton(imageName: String) -> some View {
        Button(action: {
            selectedPayment = imageName
            print("\(imageName) selected")
        }) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(selectedPayment == imageName ? Color.blue : Color.clear, lineWidth: 4)
                )
        }
    }
}
#Preview {
    cashlessPayments()
}
