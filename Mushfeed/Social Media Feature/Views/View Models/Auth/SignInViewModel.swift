//
//  SignInViewModel.swift
//  instagram
//
//  Created by Alek Michelson on 8/3/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseStorage
import SwiftUI

class SigninViewModel: ObservableObject {
    
    var email: String = ""
    var password: String = ""

    var errorString = ""
    
    @Published var showAlert: Bool = false

    
    
    func signin(email: String, password: String, completed: @escaping(_ user: User) -> Void,  onError: @escaping(_ errorMessage: String) -> Void) {
        if !email.isEmpty && !password.isEmpty {
            AuthService.signInUser(email: email, password: password, onSuccess: completed, onError: onError)
        } else {
            showAlert = true
            errorString = "Please fill in all fields"
        }
       
    }
}
