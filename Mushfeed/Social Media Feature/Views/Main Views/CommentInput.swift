//
//  CommentInput.swift
//  instagram
//
//  Created by Alek Michelson on 8/5/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import SwiftUI
import URLImage

struct CommentInput: View {
    
    @EnvironmentObject var session: SessionStore
    
    @ObservedObject var commentInputViewModel = CommentInputViewModel()
    
    @State var composedMessage: String = ""
    
    init(post: Post) {
        commentInputViewModel.post = post
    }
    
    func commentAction() {
        if !composedMessage.isEmpty {
            commentInputViewModel.setProfilePic(pfp: session.userSession!.bio)
            commentInputViewModel.addComments(text: composedMessage) {
                self.composedMessage = ""
            }
        }
    }
    
    var body: some View {
        HStack(spacing: 0) {
            
            if(session.userSession!.bio != ""){
                HStack {
                    Image(session.userSession!.bio)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                }.frame(width: 50, height: 50)
                    .padding(.leading, 15)
                
                ZStack {
                     RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 1).padding()
                     HStack {
                         TextField("Add a comment", text: $composedMessage).padding(30)
                         Button(action: commentAction) {
                             Image(systemName: "paperplane").imageScale(.large).foregroundColor(.gray).padding(30)
                         }
                     }

                 }.frame(height: 70)
            
            } else {
                Text("ERROR- Please go back and reload this page")
            }
                
     
    }
}
}

//struct CommentInput_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentInput()
//    }
//}
