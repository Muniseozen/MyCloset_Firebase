//
//  AuthViewModel.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/27.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol {
    var formValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        // Firebaseが初期化されているか確認し、初期化されていない場合は初期化します。
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }

        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    func logIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            throw error
        }
    }
    
    func createUser(withEmail email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid , username: username , email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            throw error
        }
    }
    
    func signOut() throws {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            throw error
        }
    }
    
    func deleteAccount() async throws {
        guard let user = Auth.auth().currentUser else { return }

        do {
            try await Firestore.firestore().collection("users").document(user.uid).delete()
            try await user.delete()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            throw error
        }
    }

    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        do {
            let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
            self.currentUser = try snapshot.data(as: User.self)
        } catch {
            print("Error fetching user: \(error)")
        }
    }
}
