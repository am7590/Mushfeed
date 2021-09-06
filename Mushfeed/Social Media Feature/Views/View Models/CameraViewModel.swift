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
    @Published var image: Image = Image("upload-icon")
    var profilePic: String = ""
    var imageData: Data = Data()
    var errorString = ""
    
    func setProfilePic(pfp: String){
        profilePic = pfp
    }
    
    @Published var showAlert: Bool = false
    @Published var showImagePicker: Bool = false
    
    func sharePost(completed: @escaping() -> Void,  onError: @escaping(_ errorMessage: String) -> Void) {
          if !caption.isEmpty && !imageData.isEmpty {
            Api.Post.uploadPost(caption: caption, imageData: imageData, avatar: profilePic, onSuccess: completed, onError: onError)
            print("PROFILE PIC:" + profilePic)
            //Auth.auth().currentUser.bio
          } else {
              showAlert = true
              errorString = "Please fill in all fields"
          }

    }
}
