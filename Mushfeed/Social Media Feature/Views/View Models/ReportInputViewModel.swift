//
//  ReportInputViewModel.swift
//  Mushfeed
//
//  Created by Alek Michelson on 9/5/21.
//

import Foundation
import SwiftUI
import FirebaseAuth

class ReportInputViewModel: ObservableObject {
    
    var post: Post!
    var profilePic:String = "";
    
    func setProfilePic(pfp: String){
        profilePic = pfp
    }
    
    func addReport(text: String, onSuccess: @escaping() -> Void) {
        guard let currentUserId = Auth.auth().currentUser?.uid else { return }
        guard let username = Auth.auth().currentUser?.displayName else { return }
        //guard let avatarUrl = Auth.auth().currentUser?.photoURL?.absoluteString else { return }
        
        
        Api.Report.sendReport(text: text, username: username, avatarUrl: profilePic, ownerId: currentUserId, postId: post.postId, onSuccess: {
            onSuccess()
        }) { (errorMessage) in
            print(errorMessage)
        }
    }
}
