//
//  searchBarView.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/23.
//

import SwiftUI

struct searchBarView: View {
    @Binding var searchText: String

       var body: some View {
           VStack {
               HStack(alignment: .center, spacing: 10) {
                   TextField("＠ユーザ・商品・キーワードを検索", text: $searchText)
                       .padding(.horizontal, 20)
                       .padding(.vertical, 10)
                       .background(Color.white)
                       .cornerRadius(50)
                       .shadow(color: Color.black.opacity(0.25), radius: 2, x: 0, y: 4)
                       .overlay(
                           RoundedRectangle(cornerRadius: 50)
                               .stroke( Color.primaryLight, lineWidth: 2)
                       )

                   Button(action: {
                   }) {
                       Image(systemName: "magnifyingglass")
                           .foregroundColor(.gray)
                           .padding(.horizontal, 12)
                           .padding(.vertical, 12)
                           .background(Color.white)
                           .cornerRadius(50)
                           .shadow(color: Color.black.opacity(0.25), radius: 2, x: 0, y: 4)
                           .overlay(
                               RoundedRectangle(cornerRadius: 50)
                                   .stroke( Color.primaryLight, lineWidth: 2)
                           )
                   }
               }
           }
           .padding()
       }
   }

   struct searchBarView_Previews: PreviewProvider {
       static var previews: some View {
           searchBarView(searchText: .constant(""))
       }
   }
