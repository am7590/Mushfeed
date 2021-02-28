//
//  CommentViewModel.swift
//  instagram
//
//  Created by Alek Michelson on 8/26/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase

class CommentViewModel: ObservableObject {
    
    @Published var comments: [Comment] = []
    @Published var isLoading = false
    var post: Post!
    var listener: ListenerRegistration!
    
    func loadComments() {
        self.comments = []
        self.isLoading = true
        
        Api.Comment.getComments(postId: post.postId, onSuccess: { (comments) in
            if self.comments.isEmpty {
                self.comments = comments
            }
        }, onError: { (errorMessage) in
            
        }, newComment: { (comment) in
            if !self.comments.isEmpty {
                self.comments.append(comment)
            }
        }) { (listener) in
            self.listener = listener
        }
        
 
    }
}
