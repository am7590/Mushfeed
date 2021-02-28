//
//  CameraViewModel.swift
//  instagram
//
//  Created by Alek Michelson on 8/19/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseStorage
import SwiftUI


class CameraViewModel: ObservableObject {
    
    @Published var caption: String = ""
    @Published var image: Image = Image("cameraView")
    var imageData: Data = Data()
    var errorString = ""
    
    @Published var showAlert: Bool = false
    @Published var showImagePicker: Bool = false
   
    
    func sharePost(completed: @escaping() -> Void,  onError: @escaping(_ errorMessage: String) -> Void) {
          if !caption.isEmpty && !imageData.isEmpty {
             //AuthService.signupUser(username: username, email: email, password: password, imageData: imageData, onSuccess: completed, onError: onError)
            Api.Post.uploadPost(caption: caption, imageData: imageData, onSuccess: completed, onError: onError)
            
          } else {
              showAlert = true
              errorString = "Please fill in all fields"
          }

    }
}
