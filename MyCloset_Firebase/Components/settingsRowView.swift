//
//  settingsRowView.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/23.
//

import SwiftUI

struct settingsRowView: View {
    let imageName: String
    let title: String
    let tintcolor: Color
    var body: some View {
        HStack(spacing: 12){
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tintcolor)
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(.myBlack)
        
            
            
        }
    }
}

struct settingsRowView_Previews: PreviewProvider {
    static var previews: some View{
        settingsRowView(imageName: "gear", title: "Version", tintcolor: .gray)
    }
}
