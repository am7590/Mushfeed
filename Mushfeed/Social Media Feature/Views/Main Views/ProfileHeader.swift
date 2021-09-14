//
//  ProfileHeader.swift
//  instagram
//
//  Created by Alek Michelson on 8/7/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import SwiftUI
import URLImage
import FirebaseAuth

struct ProfileHeader: View {
    var user: User?

    func replace(myString: String, _ index: Int, _ newChar: Character) -> String {
        var chars = Array(myString)    // gets an array of characters
        chars[index] = newChar
        let modifiedString = String(chars)
        return modifiedString
    }
    
    
    //var u = user?.bio ?? ""
   
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        VStack(alignment: .center) {
            if (user != nil){

                Image(colorScheme == .dark ? user?.bio[0] ?? "" : user?.bio[1] ?? "")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .shadow(radius: 15)
            }
        
        }.frame(width: 160, height: 160).padding()
    }
}

struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeader()
    }
}
