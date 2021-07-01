//
//  AuthService.swift
//  instagram
//
//  Created by Alek Michelson on 7/28/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseStorage
class AuthService {
    
    static func signInUser(email: String, password: String, onSuccess: @escaping(_ user: User) -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
               Auth.auth().signIn(withEmail: email, password: password) { (authData, error) in
                   if error != nil {
                        print(error!.localizedDescription)
                        onError(error!.localizedDescription)
                        return
                    }
                   guard let userId = authData?.user.uid else { return }

                   let firestoreUserId = Ref.FIRESTORE_DOCUMENT_USERID(userId: userId)
                   firestoreUserId.getDocument { (document, error) in
                       if let dict = document?.data() {
                           guard let decoderUser = try? User.init(fromDictionary: dict) else {return}
                            onSuccess(decoderUser)
                       }
                   }
               }
           

    }
    
    static func signupUser(username: String, email: String, password: String, imageName: String, onSuccess: @escaping(_ user: User) -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
         //Firebase.createAccount(username: username, email: email, password: password, imageData: imageData)
                Auth.auth().createUser(withEmail: email, password: password) { (authData, error) in
                    if error != nil {
                        print(error!.localizedDescription)
                        //onError(error!.localizedDescription)
                        return
                    }
                    
                    
                    
                    
                    
                    guard let userId = authData?.user.uid else { return }
                    
                    
                            if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
                                //changeRequest.photoURL = url
                                changeRequest.displayName = username
                                changeRequest.commitChanges { (error) in
                                    if error != nil {
                                       onError(error!.localizedDescription)
                                       return
                                    }
                                }
                            
                    
                    
                        
                        let firestoreUserId = Ref.FIRESTORE_DOCUMENT_USERID(userId: userId)
                        let user = User.init(uid: userId, email: email, profileImageUrl: "", username: username, bio: imageName, keywords: username.splitStringToArray())
                        
                        guard let dict = try? user.toDictionary() else {return}
    //
    //                        guard let decoderUser = try? User.init(fromDictionary: dict) else {return}
    //                        print(decoderUser.username)
                        
                        firestoreUserId.setData(dict) { (error) in
                            if error != nil {
                                onError(error!.localizedDescription)
                                return
                            }
                            onSuccess(user)
                        }
                    }
                    
                    
                    
                    
                    
//                    let storageAvatarUserId = Ref.STORAGE_AVATAR_USERID(userId: userId)
//                    let metadata = StorageMetadata()
//                    metadata.contentType = "image/jpg"
                    
                    
                    
//                    StorageService.saveAvatar(userId: userId, username: username, email: email, imageData: imageData, metadata: metadata, storageAvatarRef: storageAvatarUserId, onSuccess: onSuccess, onError: onError)
//                    
                    
 
                }
    }
}
