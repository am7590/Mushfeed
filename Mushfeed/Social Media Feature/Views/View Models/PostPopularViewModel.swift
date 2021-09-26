//
//  PostPopularViewModel.swift
//  instagram
//
//  Created by Alek Michelson on 8/20/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//


import SwiftUI

class PostPopularViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading = false
    var splitted: [[Post]] = []
    
    func loadPostPopular() {
        isLoading = true
        Api.Post.loadPosts() { (posts) in
            self.isLoading = false
            self.posts = posts
            self.splitted = self.posts.splited(into: 3)
        }
    }
}
