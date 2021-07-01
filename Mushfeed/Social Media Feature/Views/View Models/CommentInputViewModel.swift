//
//  CommentInputViewModel.swift
//  instagram
//
//  Created by Alek Michelson on 8/23/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import Foundation
import SwiftUI
import FirebaseAuth

class CommentInputViewModel: ObservableObject {
    
    var post: Post!
    var profilePic:String = "";
    
    func setProfilePic(pfp: String){
        profilePic = pfp
    }
    
    func addComments(text: String, onSuccess: @escaping() -> Void) {
        guard let currentUserId = Auth.auth().currentUser?.uid else { return }
        guard let username = Auth.auth().currentUser?.displayName else { return }
        //guard let avatarUrl = Auth.auth().currentUser?.photoURL?.absoluteString else { return }
        
        
        Api.Comment.sendComment(text: text, username: username, avatarUrl: profilePic, ownerId: currentUserId, postId: post.postId, onSuccess: {
            onSuccess()
        }) { (errorMessage) in
            print(errorMessage)
        }
    }
}
