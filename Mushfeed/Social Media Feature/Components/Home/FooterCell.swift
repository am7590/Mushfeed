//
//  FooterCell.swift
//  instagram
//
//  Created by Alek Michelson on 8/4/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import SwiftUI
import URLImage

struct FooterCell: View {
    @State private var showingImagePicker = false

    @ObservedObject var footerCellViewModel = FooterCellViewModel()
    
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
                            Text(self.footerCellViewModel.post.caption).font(.system(size: 25, weight: .bold, design: .default))
                        }.padding(.top, -5)
                        Spacer()
                        
                        HStack() {
                            
                            VStack {
                                ZStack {
                                    Image(systemName: (self.footerCellViewModel.isLiked) ? "heart.fill" : "heart").onTapGesture {
                                    if self.footerCellViewModel.isLiked {
                                        self.footerCellViewModel.unlike()
                                    } else {
                                        self.footerCellViewModel.like()
                                    }
                                    }.imageScale(.large)
                                    
//                                    Rectangle()
//                                        .stroke(Color.black,lineWidth: 2)
//                                        .frame(width: 35, height: 35)
//                                        .cornerRadius(3)
                                }//.padding(.top, -25)
                                if footerCellViewModel.post.likeCount > 0 {
                                    Text("\(footerCellViewModel.post.likeCount) \(self.footerCellViewModel.post.likeCount > 1 ? "likes" : "like")").font(.caption).foregroundColor(.gray)
                                } else {
                                    Text("0 likes").font(.caption).foregroundColor(.gray)
                                }
                            }
                            
                            ZStack {
                                NavigationLink(destination: CommentView(post: self.footerCellViewModel.post)) {
                                    Image(systemName: "bubble.left").renderingMode(.original).imageScale(.large)
                                }
//                                Rectangle()
//                                    .stroke(Color.black,lineWidth: 2)
//                                    .frame(width: 35, height: 35)
//                                    .cornerRadius(3)
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

////
////  FooterCell.swift
////  instagram
////
////  Created by Alek Michelson on 8/4/20.
////  Copyright © 2020 Alek Michelson. All rights reserved.
////
//
//import SwiftUI
//import URLImage
//
//struct FooterCell: View {
//
//    @ObservedObject var footerCellViewModel = FooterCellViewModel()
//
//    init(post: Post) {
//        self.footerCellViewModel.post = post
//        self.footerCellViewModel.checkPostIsLiked()
//    }
//
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 8) {
//
//            ZStack {
//                RoundedRectangle(cornerRadius: 25, style: .continuous).stroke(Color.black, lineWidth: 1)
//                    .frame(height: 120.0).padding(.leading, 15).padding(.trailing, 15)
//
//
//                VStack{
//                    HStack {
//                        Text(self.footerCellViewModel.post.username).font(.subheadline).bold()
//                        Text(self.footerCellViewModel.post.caption).font(.subheadline)
//                    }
//            HStack() {
//                Spacer()
//                ZStack {
//                    NavigationLink(destination: CommentView(post: self.footerCellViewModel.post)) {
//                        Image(systemName: "bubble.left").renderingMode(.original)
//                    }
//                    Circle()
//                        .stroke(Color.black,lineWidth: 1)
//                        .frame(width: 50, height: 50)
//                }.padding(.top, -25)
//
//                Spacer()
//
//                VStack {
//                    ZStack {
//                        Image(systemName: (self.footerCellViewModel.isLiked) ? "heart.fill" : "heart").onTapGesture {
//                        if self.footerCellViewModel.isLiked {
//                            self.footerCellViewModel.unlike()
//                        } else {
//                            self.footerCellViewModel.like()
//                        }
//                        }
//
//                        Circle()
//                            .stroke(Color.black,lineWidth: 1)
//                            .frame(width: 50, height: 50)
//                    }.padding(.top, -5)
//                    if footerCellViewModel.post.likeCount > 0 {
//                        Text("\(footerCellViewModel.post.likeCount) \(self.footerCellViewModel.post.likeCount > 1 ? "likes" : "like")").font(.caption).foregroundColor(.gray)
//                    } else {
//                        Text("0 likes").font(.caption).foregroundColor(.gray)
//                    }
//                }
//
//                Spacer()
//
//                ZStack {
//                    Image(systemName: "paperplane.fill")
//                    Circle()
//                        .stroke(Color.black,lineWidth: 1)
//                        .frame(width: 50, height: 50)
//                }.padding(.top, -25)
//
//                Spacer()
//            }.padding(.top, 5)
//                }
//            }
//            Text(timeAgoSinceDate(Date(timeIntervalSince1970: self.footerCellViewModel.post.date), currentDate: Date(), numericDates: true)).font(.caption).foregroundColor(.gray).padding(.leading, 15)
//
//            Divider().padding(.leading, 15).padding(.trailing, 15)
//            Spacer()
//            }
//
//
//    }
//}
//
//
//
//
//
