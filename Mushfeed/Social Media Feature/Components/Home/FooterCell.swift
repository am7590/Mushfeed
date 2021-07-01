//
//  FooterCell.swift
//  instagram
//
//  Created by Alek Michelson on 8/4/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import SwiftUI
import URLImage
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage

struct FooterCell: View {
    @State private var showingImagePicker = false
    @EnvironmentObject var session: SessionStore
    @ObservedObject var footerCellViewModel = FooterCellViewModel()
    @State var showActionSheet = false
    
    init(post: Post) {
        self.footerCellViewModel.post = post
        self.footerCellViewModel.checkPostIsLiked()
    }
    

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

            ZStack {
//                RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(Color.black, lineWidth: 1)
//                    .frame(height: 40.0).padding(.leading, 15).padding(.trailing, 15)
//
                
                VStack{
                    HStack {
                        HStack {
                        //Text(self.footerCellViewModel.post.username).font(.headline).bold()
                            Text(self.footerCellViewModel.post.caption).font(.system(size: 20, weight: .bold, design: .default))
                        }.padding(.top, -5)
                        Spacer()
                        
                        HStack() {
                            
                            if footerCellViewModel.post.username == session.userSession?.username {
                                Button(action :{
                                    self.showActionSheet = true
                                }) {
                                    Image(systemName: "trash").imageScale(.large).foregroundColor(Color.primary).padding(.top, -10)
                                }.actionSheet(isPresented: $showActionSheet){
                                    ActionSheet(title:Text("Delete Post"), message: Text("Your post will be deleted momentarily."), buttons: [.default(Text("Yes"), action: {
                                                guard let userId = Auth.auth().currentUser?.uid else {
                                                    return
                                                }
                                                var postId = Ref.FIRESTORE_MY_POSTS_DOCUMENT_USERID(userId: userId).collection("userPosts").document().documentID
                                                
                                                                                                                                                            Ref.FIRESTORE_COLLECTION_ALL_POSTS.document(self.footerCellViewModel.post.postId).delete() { err in
                                            if let err = err {
                                                print("Error Deleting Document: \(err)")
                                            } else {
                                                print("User ID: " + userId + "Post ID: " + self.footerCellViewModel.post.postId)
                                            }
                                        
                                        }
                                                                                                                                                            postId = Ref.FIRESTORE_TIMELINE_DOCUMENT_USERID(userId: userId).collection("timelinePosts").document(postId).documentID
                                                                                                                                                            
                                                                                                                                                            Ref.FIRESTORE_TIMELINE_DOCUMENT_USERID(userId: userId).collection("timelinePosts").document(self.footerCellViewModel.post.postId).delete() { err in
                                            if let err = err {
                                                print("Error Deleting Document: \(err)")
                                            } else {
                                                print("User ID: " + userId + "Post ID: " + self.footerCellViewModel.post.postId)
                                            }
    
                                                                                                                                                                Ref.FIRESTORE_MY_POSTS_DOCUMENT_USERID(userId: userId).collection("userPosts").document(self.footerCellViewModel.post.postId).delete() { err in
                                            if let err = err {
                                                print("Error Deleting Document: \(err)")
                                            } else {
                                                print("User ID: " + userId + "Post ID: " + self.footerCellViewModel.post.postId)
                                            }
                                        
                                        }
                                                                                                                    
                                                                                                                                                                
//                                            Ref.STORAGE_POST_ID(postId: postId).delete() { error in
//                                                if error != nil {
//                                                    print("Storage error")
//                                                } else {
//                                                    print("Storage error")
//                                                }
//                                        }
                                        }
                                                                                                                                                            
                                        print("Delete successful")}
                                    ), .cancel()
                                    ])
                                
                                    
                                }
                            }
                            
                            VStack {
                                ZStack {
                                    Image(systemName: (self.footerCellViewModel.isLiked) ? "heart.fill" : "heart").onTapGesture {
                                    if self.footerCellViewModel.isLiked {
                                        self.footerCellViewModel.unlike()
                                    } else {
                                        self.footerCellViewModel.like()
                                    }
                                    }.imageScale(.large)
                                    
                                }
                                if footerCellViewModel.post.likeCount > 0 {
                                    Text("\(footerCellViewModel.post.likeCount) \(self.footerCellViewModel.post.likeCount > 1 ? "likes" : "like")").font(.caption).foregroundColor(.gray)
                                } else {
                                    Text("0 likes").font(.caption).foregroundColor(.gray)
                                }
                            }
                            
                            ZStack {
                                NavigationLink(destination: CommentView(post: self.footerCellViewModel.post)) {
                                    Image(systemName: "bubble.left").imageScale(.large).foregroundColor(Color.primary)
                                    
                                }
                            }.padding(.top, -10)
                            
                            
                            
                            
                            
            
                        }
                        
                        
                    }.padding(.trailing, 15).padding(.leading, 15)
            
                }
            }
            Text(timeAgoSinceDate(Date(timeIntervalSince1970: self.footerCellViewModel.post.date), currentDate: Date(), numericDates: true)).font(.caption).foregroundColor(.gray).padding(.leading, 15).padding(.top, -5)

            Divider().padding(.leading, 15).padding(.trailing, 15)
            Spacer()
            }
        
    
    }
}
