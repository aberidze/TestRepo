//
//  SignUpViewModel.swift
//  What? Where? When?
//
//  Created by Macbook Air 13 on 05.02.24.
//

import Foundation

final class SignUpViewModel {
    
    private let authManager: AuthenticationManager
    
    // MARK: - Init
    init(authManager: AuthenticationManager = AuthenticationManager.shared) {
        self.authManager = authManager
    }
    
    // MARK: - Methods
    func registerUser(userRequest: RegisterUserRequest) {
        Task {
            do {
                let returnedUserData = try await authManager.createUser(email: userRequest.email, password: userRequest.password)
                print("Success")
                print(returnedUserData)
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
