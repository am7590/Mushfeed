//
//  ProfileInformation.swift
//  Instagram
//
//  Created by David Tran on 2/29/20.
//  Copyright © 2020 zero2launch. All rights reserved.
//

import SwiftUI

struct ProfileInformation: View {
    var user: User?
    var body: some View {
        
        VStack(alignment: .center, spacing: 4) {
            if user != nil {
                Text(user!.username).font(.largeTitle)
                    .fontWeight(.bold)
                
                
                //Text("IOS Developer")
            }
            
        }
    }
}

