//
//  tagsView.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/23.
//

import SwiftUI

struct tagsView: View {
    var image: Image
    var text: String
    var color: Color
    
    var body: some View {
        HStack(spacing: 8) {
            image
                .resizable()
                .frame(width: 18, height: 18)
                .foregroundColor(color)
            Text(text)
                .font(Font.custom("Noto Sans JP Bold", size: 14).weight(.bold))
                .foregroundColor(color)
        }
        .padding(EdgeInsets(top: 2, leading: 6, bottom: 2, trailing: 6))
        .frame(width: 100, height: 23)
        .background(Color.white)
        .cornerRadius(5)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .inset(by: -0.75)
                .stroke(color, lineWidth: 2)
        )
    }
}

struct tagsView_Previews: PreviewProvider {
    static var previews: some View {
        tagsView(image: Image("Tag"), text: "タグ付き", color: Color.myBlue)
    }
}
