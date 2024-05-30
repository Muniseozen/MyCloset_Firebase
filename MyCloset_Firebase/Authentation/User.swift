//
//  User.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/27.
//

import Foundation

struct User:Identifiable,Codable {
    let id: String
    let username: String
    let email: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: username) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}
