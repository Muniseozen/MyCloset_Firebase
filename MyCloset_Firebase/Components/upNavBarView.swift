//
//  upNavBarView.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/23.
//

import SwiftUI

struct upNavBarView: View {
    let title: String
    @Environment(\.presentationMode) var presentationMode // Access the presentation mode environment variable

    var body: some View {
        VStack {
            HStack {
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Action to go back to the previous page
                }) {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 22))
                        .foregroundColor(.myDarkGray) // Custom color
                       
                }
                Spacer()
                Text(title)
                    .font(.custom("Noto Sans JP SemiBold", size: 16))
                    
                    .foregroundColor(.myDarkGray) // Custom color
                
            }
            .padding()
            Divider()
    
        }
        .background(Color.white) // Set background color to white or your desired color
    }
}

struct upNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            upNavBarView(title: "商品詳細")
                .previewLayout(.sizeThatFits)
        }
    }
}
