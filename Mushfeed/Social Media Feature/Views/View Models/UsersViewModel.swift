//
//  UsersViewModel.swift
//  instagram
//
//  Created by Alek Michelson on 8/17/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import Foundation
import SwiftUI

class UsersViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    var searchText: String = ""
    
    func searchTextDidChange() {
        isLoading = true
        //Api.User.searchUsers(text: searchText)
        Api.User.searchUsers(text: searchText) { (users) in
            self.isLoading = false
            self.users = users
        }
    }
}
