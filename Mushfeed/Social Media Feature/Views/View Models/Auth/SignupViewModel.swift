//
//  SignupViewModel.swift
//  instagram
//
//  Created by Alek Michelson on 7/28/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import SwiftUI

class SignupViewModel: ObservableObject {
    @EnvironmentObject var session: SessionStore

     var username: String = ""
     var email: String = ""
     var password: String = ""
     var image: Image = Image(IMAGE_USER_PLACEHOLDER)
     var imageData: Data = Data()
     var errorString = ""
    var imageName: [String] = ["", ""]
     @Published var showImagePicker: Bool = false
     @Published var showAlert: Bool = false
    
    func setImage(imageN: String, imageB: String){
        self.imageName[0] = imageN
        self.imageName[1] = imageB
        print("Set image\nself.imageName[0]: "+self.imageName[0]+"\nself.imageName[1]: "+self.imageName[1])
        //print(self.imageName)
    }

    func signup(username: String, email: String, password: String, imageData: Data, completed: @escaping(_ user: User) -> Void,  onError: @escaping(_ errorMessage: String) -> Void) {
        if !username.isEmpty && !email.isEmpty && !password.isEmpty && !imageName.isEmpty { 
            AuthService.signupUser(username: username, email: email, password: password, imageName: imageName, onSuccess: completed, onError: onError)
        } else if self.imageName[0]=="" || self.imageName[1] == "" {
            showAlert = true
            errorString = "Please select a profile picture"
        } else {
            showAlert = true
            errorString = "Please fill in all fields"
            print(self.username)
            print(self.email)
            print(self.password)
            print(self.imageName[0] + " " + self.imageName[1])
        }
    }
}

