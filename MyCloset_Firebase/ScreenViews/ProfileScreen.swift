//
//  ProfileScreen.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/28.
//

import SwiftUI

struct ProfileScreen: View {

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ProfileScreenUpNavBar(usernamelink: "@rina_chisato")
                MainProfileHeader(name: "Chisato Rina", rating: 4, ratingCount: 12, profileImageName: "profilePic1")
                Divider()
                ScrollView {
                   
                }
                .padding()
            }

                    }
                }
            }



#Preview {
    ProfileScreen()
}
