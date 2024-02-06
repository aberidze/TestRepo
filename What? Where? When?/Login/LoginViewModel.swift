//
//  LoginViewModel.swift
//  What? Where? When?
//
//  Created by Macbook Air 13 on 06.02.24.
//

import SwiftUI
import Firebase

final class LoginViewModel: ObservableObject {

    // MARK: - Properties
    private let authManager: AuthenticationManager
    @Published var userIsSignedIn: Bool = false
    @Published var email = ""
    @Published var password = ""
    @Published var showLogin: Bool = false
    @Published var offsetY = UIScreen.main.bounds.height
    
    
    // MARK: - Init
    init(authManager: AuthenticationManager = AuthenticationManager.shared) {
        self.authManager = authManager
    }
    
    
    // MARK: - Methods
    func animate() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(.easeInOut(duration: 0.5)) {
                self.showLogin = true
                self.offsetY = 0
            }
        }
    }
    
    @MainActor
    func signUserIn() {
        Task {
            do {
                let returnedUserData = try await authManager.signInUser(email: email, password: password)
                userIsSignedIn = true
                print("Signed In")
                print(returnedUserData)
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
