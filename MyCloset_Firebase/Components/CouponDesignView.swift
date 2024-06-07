//
//  CouponDesignView.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/06/07.
//

import SwiftUI

struct Coupon: Identifiable {
    let id = UUID()
    let backgroundImageName: String
    let discountText: String
    let discountAmount: String
    let expirationDate: String
    let couponID: String
}

struct CouponView: View {
    let coupon: Coupon
    
    var body: some View {
        HStack(spacing: 2) {
            ZStack {
                Image(coupon.backgroundImageName)
                 
            }
            .foregroundColor(.white)
            
            ZStack {
                Image("Coupon1-1")
                    .scaledToFit()
                VStack(alignment: .leading, spacing: 0) {
                    let discountTexts = coupon.discountText.split(separator: " ")
                    if discountTexts.count > 1 {
                        Text(String(discountTexts[0]))
                            .font(Font.custom("Noto Sans JP Regular", size: 40))
                        Text(String(discountTexts[1]))
                            .font(Font.custom("Noto Sans JP Regular", size: 40))
                    } else {
                        Text(coupon.discountText)
                            .font(Font.custom("Noto Sans JP Regular", size: 40))
                    }
                    HStack {
                        Text(coupon.discountAmount)
                            .font(Font.custom("Noto Sans JP Bold", size: 40))
                        Text("OFF")
                            .font(Font.custom("Noto Sans JP Regular", size: 24))
                        VStack(alignment: .center,spacing: 4) {
                            Text(coupon.expirationDate)
                                .font(Font.custom("Noto Sans JP Regular", size: 12))
                            
                            Text(coupon.couponID)
                                .font(Font.custom("Noto Sans JP Regular", size: 12))
                                .background(Color.white)
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            
            .foregroundColor(.white)
        }

    }
}

struct CouponDesignView: View {
    let coupons: [Coupon] = [
        Coupon(backgroundImageName: "Coupon1-2", discountText: "CRISTMAS SALE", discountAmount: "20%", expirationDate: "3月20日まで有効", couponID: "1234567890"),
        // Add other coupons here
    ]
    
    var body: some View {
        VStack {
            ForEach(coupons) { coupon in
                CouponView(coupon: coupon)
            }
        }
        .padding(.horizontal, 16) // Add padding to the edges
    }
}

#Preview {
    CouponDesignView()
}
