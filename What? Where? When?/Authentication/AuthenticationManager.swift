//
//  AuthenticationManager.swift
//  What? Where? When?
//
//  Created by Macbook Air 13 on 05.02.24.
//

import Foundation
import FirebaseAuth

final class AuthenticationManager {
    
    static let shared = AuthenticationManager()
    private init() {}
    
    // MARK: - Methods
    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
}
