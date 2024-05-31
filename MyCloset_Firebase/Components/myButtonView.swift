//
//  myButtonView.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/23.
//

import SwiftUI

struct myButtonView: View {
    var title: String
       var iconName: String?
       var action: () -> Void

       var body: some View {
           Button(action: {
               self.action()
           }) {
               HStack {
                         Text(title)
                       .font(.title2)
                       .fontWeight(.bold)
                   if let iconName = iconName {
                       Image(systemName: iconName)
                   }
                     }
               .foregroundColor(.white)
               .padding()
               .frame(width: UIScreen.main.bounds.width - 32, height: 48)
               .background(.primaryMain) // ここで背景色を指定
               .cornerRadius(50)
           }
       }
   }

struct myButtonView_Previews: PreviewProvider {
    static var previews: some View {
        myButtonView(title: "Click Me",iconName: "arrow.right") {
            print("Button clicked!")
        }
    }
}
