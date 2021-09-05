//
//  ReportApi.swift
//
//  Created by Alek Michelson on 10/5/21.
//  Copyright © 2021 Alek Michelson. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseStorage
import Firebase

class ReportApi {
    func sendReport(text: String, username: String, avatarUrl: String, ownerId: String, postId: String, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        let comment = Comment(comment: text, avatarUrl: avatarUrl, ownerId: ownerId, postId: postId, username: username, date: Date().timeIntervalSince1970)
        guard let dict = try? comment.toDictionary() else {return}
        
        Ref.FIRESTORE_COMMENTS_DOCUMENT_POSTID(postId: postId).collection("reportedPosts").addDocument(data: dict) { (error) in
            if let error = error {
                onError(error.localizedDescription)
                return
            }
            onSuccess()
        }
        
    }
   
}
