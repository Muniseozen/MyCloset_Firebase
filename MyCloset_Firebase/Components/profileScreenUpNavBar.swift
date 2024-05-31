//
//  profileScreenUpNavBar.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/30.
//

import SwiftUI

struct ProfileScreenUpNavBar: View {
    var usernamelink: String
    
    var body: some View {
        HStack {
            Text(usernamelink)
            Image("share")
            Spacer()
            NavigationLink(destination: SettingsScreen()) {
                Image(systemName: "slider.horizontal.3")
                    .font(.title3)
            }
        }
        .foregroundColor(.black)
        .padding()
    }
}


#Preview {
    ProfileScreenUpNavBar(usernamelink: "@rina_chisato")
}
