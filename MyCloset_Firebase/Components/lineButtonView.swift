//
//  lineButtonView.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/29.
//

import SwiftUI

struct lineButtonView: View {
    var label: String
    var backgroundColor: Color
    var textColor: Color
    var borderColor: Color
    var action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            HStack(alignment: .center, spacing: 0) {
                Text(label)
                    .font(.custom("Noto Sans JP", size: 16))
                    .foregroundColor(textColor)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .frame(width: 200, height: 46, alignment: .center)
            .background(backgroundColor)
            .cornerRadius(50)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .inset(by: 1)
                    .stroke(borderColor, lineWidth: 2)
            )
        }
    }
}

#Preview {
    lineButtonView(
        label: "Button Text",
        backgroundColor: .white,
        textColor: .secondaryMain,
        borderColor: .secondaryMain,
        action: {
            print("Button pressed")
        }
    )
}
