//
//  RegisterUserRequestModel.swift
//  What? Where? When?
//
//  Created by Macbook Air 13 on 05.02.24.
//

import Foundation

struct RegisterUserRequest {
    let fullName: String
    let email: String
    let birthDate: String
    let city: String
    let aboutMe: String?
    let password: String
}
