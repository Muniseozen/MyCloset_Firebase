//
//  appIcon.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/23.
//

import SwiftUI

struct appIcon: View {
    var body: some View {
        VStack(spacing:2){
            Image("hanger")

                .shadow(color: .black.opacity(0.75), radius: 2, x: 0, y: 4)
            HStack{
                Circle()
                    .foregroundColor(.primaryMain)
                    .frame(width: 50, height: 50)
                    .shadow(color: Color.black.opacity(0.25), radius: 2, x: 0, y: 4)
                Circle()
                    .foregroundColor(.primaryExtraLight)
                    .frame(width: 50, height: 50)
                    .shadow(color: Color.black.opacity(0.25), radius: 2, x: 0, y: 4)
                Circle()
                    .foregroundColor(.secondaryExtraLight)
                    .frame(width: 50, height: 50)
                    .shadow(color: Color.black.opacity(0.25), radius: 2, x: 0, y: 4)
                Circle()
                    .foregroundColor(.secondaryMedium)
                    .frame(width: 50, height: 50)
                    .shadow(color: Color.black.opacity(0.25), radius: 2, x: 0, y: 4)
            }
            Text("My Closet")
                .font(Font.custom("Paytone One", size: 46))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.34, green: 0.21, blue: 0.46))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top,-8)
        }
    }
}

struct appIcon_Previews: PreviewProvider {
    static var previews: some View {
        appIcon()
        }
}
