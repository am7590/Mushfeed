//
//  UserProfileView.swift
//  instagram
//
//  Created by Alek Michelson on 8/9/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import SwiftUI

struct UserProfileView: View {
    var user: User
    @ObservedObject var profileViewModel = ProfileViewModel()
    @State var selection: Selection = .table
    var posts = 0
    var body: some View {
        return
            
                ScrollView {
                   VStack(alignment: .center, spacing: 15) {
                    // Profile image
                    ProfileHeader(user: user)
                    
                    // Username
                    ProfileInformation(user: user)
                    Divider().padding(.leading, 15).padding(.trailing, 15).background(Color.secondary)

                    
                    // FollowButton() MessageButton()
                    if(self.profileViewModel.posts.count > 0){
                        Picker(selection: $selection, label: Text("Grid or Table")) {
                                   ForEach(Selection.allCases) { selection in
                                       selection.image.tag(selection)
                                               
                                   }
                        }.pickerStyle(SegmentedPickerStyle()).padding(.leading, 20).padding(.trailing, 20)
                   
                   
            
                    } else {
                        Text("No Posts")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top, 5)
                    }
                      
                    if !profileViewModel.isLoading {
                        if selection == .grid {
                                      GridPosts(splitted: self.profileViewModel.splitted)
                                  } else {
                                      ForEach(self.profileViewModel.posts, id: \.postId) { post in
                                          VStack {
                                              HeaderCell(post: post)
                                              FooterCell(post: post)
                                          }
                                      }
                                     
                                  }
                      
                    }
                       
                }.padding(.top, 20)
                                 
                }.navigationBarTitle(Text(self.user.username), displayMode: .inline).onAppear {
                    self.profileViewModel.loadUserPosts(userId: self.user.uid)
                }
      
        
    }
}

//struct UserProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileView()
//    }
//}

struct FollowButton: View {
    var body: some View {
        Button(action: {}) {
            HStack {
                Spacer()
                Text("Follow").fontWeight(.bold).foregroundColor(Color.white)
                Spacer()
            }.frame(height: 30).background(Color.blue)
            
        }.cornerRadius(5)
    }
}

struct MessageButton: View {
    var body: some View {
        Button(action: {}) {
            HStack {
                Spacer()
                Text("Message").fontWeight(.bold).foregroundColor(Color.black)
                Spacer()
            }.frame(height: 30).background(Color.white)
            
        }.overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray.opacity(0.5), lineWidth: 1))
    }
}
