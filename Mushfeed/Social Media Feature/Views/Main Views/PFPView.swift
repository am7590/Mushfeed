//
//  PFPView.swift
//  Mushfeed
//
//  Created by Alek Michelson on 7/1/21.
//

import SwiftUI
import URLImage
import FirebaseAuth

struct PFPView: View {
    var user: User?
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
            if (user != nil){
                Image(colorScheme == .dark ? user?.bio[0] ?? "" : user?.bio[1] ?? "")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
            }
        
    }
}

struct PFPView_Previews: PreviewProvider {
    static var previews: some View {
        PFPView()
    }
}

