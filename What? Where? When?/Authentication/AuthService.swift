//
//  AuthService.swift
//  What? Where? When?
//
//  Created by Macbook Air 13 on 05.02.24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class AuthService {
    
    public static let shared = AuthService()
    private init() {}
    
    // MARK: - Methods
    public func registerUser(with userRequest: RegisterUserRequest, completion: @escaping (Bool, Error?)->Void) {
        let fullName    = userRequest.fullName
        let birthDate   = userRequest.birthDate
        let city        = userRequest.city
        let aboutMe     = userRequest.aboutMe
        let email       = userRequest.email
        let password    = userRequest.password
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(false, error)
                return
            }
            
            guard let resultUser = result?.user else {
                completion(false, nil)
                return
            }
            
            // Add User to Firestore Database:
            let database = Firestore.firestore()
            database.collection("users")
                .document(resultUser.uid)
                .setData([
                    "fullname" : fullName,
                    "email" : email,
                    "birthdate": birthDate,
                    "city" : city,
                    "about" : aboutMe ?? ""
                ]) { error in
                    if let error = error {
                        completion(false, error)
                        return
                    }
                    completion(true, nil)
                }
        }
    }
}
