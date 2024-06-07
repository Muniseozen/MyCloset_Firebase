//
//  CouponScreen.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/23.
//

import SwiftUI

enum CouponCategory {
    case collect
    case obtained
}


struct CouponScreen: View {
    @State static var hasNotification = true
    @State private var selectedCategory: CouponCategory = .collect
    private let collectCoupons = ["Coupon 1", "Coupon 2", "Coupon 3"]
    private let obtainedCoupons = ["Obtained Coupon 1", "Obtained Coupon 2"]
    

        var body: some View {
            NavigationView {
                VStack(spacing: 0) {
                        //UpNavBarView
                          HomeUpNavBar(hasNotification: CouponScreen.$hasNotification)
                    Divider()
                          //Switch Button View
                          HStack(spacing: 0) {
                              Button(action: {
                                  selectedCategory = .collect
                              }) {
                                  Text("クーポンを集める")
                                      .font(selectedCategory == .collect ? Font.custom("Noto Sans JP Bold", size: 18) : Font.custom("Noto Sans JP Regular", size: 16))
                                      .frame(maxWidth: .infinity,maxHeight: 24)
                                      .padding()
                                      .background(selectedCategory == .collect ? Color.white : Color.myLightGray)
                                      .foregroundColor(selectedCategory == .collect ? Color.secondaryMedium : Color.myGray)
                                      .cornerRadius(selectedCategory == .collect ? 0 : 20, corners: [ .bottomRight])
                              }
                              Button(action: {
                                  selectedCategory = .obtained
                              }) {
                                  Text("獲得クーポン")
                                      .font(selectedCategory == .obtained ? Font.custom("Noto Sans JP Bold", size: 18) : Font.custom("Noto Sans JP Regular", size: 16))
                                      .frame(maxWidth: .infinity,maxHeight: 24)
                                      .padding()
                                      .background(selectedCategory == .obtained ? Color.white : Color.myLightGray)
                                      .foregroundColor(selectedCategory == .collect ? Color.myGray : Color.secondaryMedium)
                                      .cornerRadius(selectedCategory == .collect ? 20 : 0, corners: [.bottomLeft])
                              }
                          }

                          ScrollView {
                              VStack {
                                  ForEach(getCoupons(), id: \.self) { coupon in
                                    CouponDesignView()
                                  }
                                  
                              }
                              
                              .padding() // Add padding to the edges
                          }
                          
                      }
                   
                  }
              }

              func getCoupons() -> [String] {
                  switch selectedCategory {
                  case .collect:
                      return collectCoupons
                  case .obtained:
                      return obtainedCoupons
                  }
              }
          }


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

    
struct CouponScreen_Previews: PreviewProvider {
    static var previews: some View {
        CouponScreen()
    }
}

