//
//  ProfileInformation.swift
//  instagram
//
//  Created by Alek Michelson on 8/9/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import SwiftUI

struct ProfileInformation: View {
    var user: User?
    @ObservedObject var usersViewModel = UsersViewModel()
    var body: some View {
        
        VStack(alignment: .center, spacing: 4) {
            if user != nil {
                Text(user!.username).font(.largeTitle)
                    .fontWeight(.bold)
            } 

            
        }
    }
}

