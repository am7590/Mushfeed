//
//  ProfileViewModel.swift
//  instagram
//
//  Created by Alek Michelson on 8/19/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//


import Foundation
import SwiftUI
import FirebaseAuth

class ProfileViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading = false
    var splitted: [[Post]] = []
    
    func loadUserPosts(userId: String) {
        isLoading = true
        Api.User.loadPosts(userId: userId) { (posts) in
            self.isLoading = false
            self.posts = posts
            self.splitted = self.posts.splited(into: 3)
            
        }
    }
    
    
    func seeLoginInfo() -> Bool {
        if let providerData = Auth.auth().currentUser?.providerData {
            for userInfo in providerData {
                switch userInfo.providerID {
                      case "apple.com":
                          print("Apple Login")
                        return true
                          //isVerifiededUser = true
                      default:
                          print("provider is \(userInfo.providerID)")
                      }
            }
        }
        return false
    }
    
    

}
