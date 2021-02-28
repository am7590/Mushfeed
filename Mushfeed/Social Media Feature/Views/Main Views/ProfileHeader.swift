//
//  ProfileHeader.swift
//  instagram
//
//  Created by Alek Michelson on 8/7/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import SwiftUI
import URLImage
struct ProfileHeader: View {
    var user: User?
    var body: some View {
        VStack(alignment: .center) {
            if user != nil {

                URLImage(URL(string: user!.profileImageUrl)!,
                content: {
                    $0.image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .shadow(radius: 15)
                        
                }).frame(width: 160, height: 160)
                    
                        
//                    Spacer()
//                    VStack {
//                        Text("50").font(.headline)
//                        Text("Posts").font(.subheadline)
//                    }.padding(10)
//                    VStack {
//                        Text("100").font(.headline)
//                        Text("Followers").font(.subheadline)
//                    }.padding(10)
//                    VStack {
//                        Text("200").font(.headline)
//                        Text("Following").font(.subheadline)
//                    }.padding(10)
//                    Spacer()
            }
        }
    }
}

struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeader()
    }
}
