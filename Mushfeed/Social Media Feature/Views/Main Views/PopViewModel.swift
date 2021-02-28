//
//  PopViewModel.swift
//  instagram
//
//  Created by Alek Michelson on 2/26/21.
//  Copyright © 2021 Alek Michelson. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase


class PopViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading = false
    var listener: ListenerRegistration!
    init() {
        loadPosts()
    }

    func loadPosts() {
        self.posts = []
        isLoading = true
        
        Api.Post.loadPosts() { (posts) in
            self.isLoading = false
            self.posts = posts
            
        }
    }
}
