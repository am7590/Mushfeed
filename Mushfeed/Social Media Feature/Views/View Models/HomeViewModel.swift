//
//  HomeViewModel.swift
//  instagram
//
//  Created by Alek Michelson on 8/20/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//


import Foundation
import SwiftUI
import Firebase


class HomeViewModel: ObservableObject {
    
    @Published var posts: [Post] = []
    @Published var isLoading = false
    var listener: ListenerRegistration!
    init() {
        loadTimeline()
    }
    
    func loadTimeline() {
        self.posts = []
        isLoading = true
        
        Api.Post.loadTimeline(onSuccess: { (posts) in
            self.isLoading = false
            if self.posts.isEmpty {
                self.posts = posts
            }
        }, newPost: { (post) in
            if !self.posts.isEmpty {
                self.posts.insert(post, at: 0)
            }
        }) { (listener) in
            self.listener = listener
        }
    }
}
