//
//  authInputView.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/23.
//

import SwiftUI

struct authInputView: View {
    @Binding var text: String
     let title: String
     let placeholder: String
     var isSecureField = false
     
     var body: some View {
         VStack(alignment: .leading, spacing: 8) {
             Text(title)
                 .foregroundColor(Color(.primaryMain))
                 .font(Font.custom("Noto Sans JP SemiBold", size: 14))
             
             if isSecureField {
                 SecureField(placeholder, text: $text)
                     .padding(12)
                     .background(Color(.white))
                     .cornerRadius(10)
                     .overlay(
                         RoundedRectangle(cornerRadius: 10)
                             .stroke(Color(.primaryLight), lineWidth: 1.5)
                     )
                     .font(.system(size: 14))
                     .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 0)
             } else {
                 TextField(placeholder, text: $text)
                     .padding(12)
                     .background(Color(.white))
                     .cornerRadius(10)
                     .overlay(
                         RoundedRectangle(cornerRadius: 10)
                             .stroke(Color(.primaryMedium), lineWidth: 1.5)
                     )
                     .font(.system(size: 14))
                 
             }
             
         }
         
     }
     
 }

 struct authInputView_Previews: PreviewProvider {
     static var previews: some View {
         Group {
             authInputView(text: .constant(""), title: "Email Address", placeholder: "name@example.com")
                 .previewLayout(.sizeThatFits)
                 .padding()
             
             authInputView(text: .constant(""), title: "Password", placeholder: "Enter your password", isSecureField: true)
                 .previewLayout(.sizeThatFits)
                 .padding()
         }
     }
 }
