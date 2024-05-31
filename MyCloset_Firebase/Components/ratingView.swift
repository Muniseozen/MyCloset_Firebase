//
//  ratingView.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/30.
//

import SwiftUI

struct ratingView: View {
    var rating: Int
    var ratingCount: Int
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<5) { index in
                Image(systemName: index < rating ? "star.fill" : "star")
                    .frame(width: 16, height: 16)
                    .foregroundColor(.yellow)
            }
            Text("(\(ratingCount))")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}
