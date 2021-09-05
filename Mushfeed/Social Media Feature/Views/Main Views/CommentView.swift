//
//  CommentView.swift
//  
//
//  Created by Alek Michelson on 8/5/20.
//

import SwiftUI

struct CommentView: View {
    
    @ObservedObject var commentViewModel = CommentViewModel()

    var post: Post!
    

    var body: some View {
        VStack {
            ScrollView {
                if !commentViewModel.comments.isEmpty {
                    ForEach(commentViewModel.comments) { comment in
                    CommentRow(comment: comment).padding(.bottom, 10)
                }
                
              }
            }
            CommentInput(post: post)
        }.padding(.top, 15).onAppear {
            self.commentViewModel.post = self.post
            self.commentViewModel.loadComments()
        }.onDisappear {
            if self.commentViewModel.listener != nil {
                self.commentViewModel.listener.remove()

            }
	        }
      


    }
}

//struct CommentView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentView()
//    }
//}
