//
//  RegisterUserRequestModel.swift
//  What? Where? When?
//
//  Created by Macbook Air 13 on 05.02.24.
//

import Foundation

final class RegisterUserRequest {
    
    // MARK: - Properties
    let fullName: String
    let email: String
    let birthDate: String
    let city: String
    let password: String
    
    
    // MARK: - Initializers
    init(fullName: String, email: String, birthDate: String, city: String, password: String) {
        self.fullName = fullName
        self.email = email
        self.birthDate = birthDate
        self.city = city
        self.password = password
    }
}
