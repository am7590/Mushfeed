//
//  UsersView.swift
//  instagram
//
//  Created by Alek Michelson on 8/9/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import SwiftUI
import URLImage

struct UsersView: View {
    
    @ObservedObject var usersViewModel = UsersViewModel()
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
                  VStack {
                      SearchBar(text: $usersViewModel.searchText, onSearchButtonChanged: usersViewModel.searchTextDidChange)

                      List {
                          if !usersViewModel.isLoading {

                                  ForEach(usersViewModel.users, id: \.uid) { user in
//                                    NavigationLink({
//                                            HStack {
//                                                Image(colorScheme == .dark ? user.bio[1] : user.bio[0])//URLImage(url: URL(string: user.profileImageUrl)!,
//                                                    .resizable()
//                                                    .aspectRatio(contentMode: .fill)
//                                                //.clipShape(Circle())
//                                            }.frame(width: 50, height: 50)
//                                            VStack(alignment: .leading, spacing: 5) {
//                                                Text(user.username).font(.headline).bold()
//                                                Text("Mushfeed User").font(.subheadline)
//                                            }
////
//                                    }, destination: UserProfileView(user: user).padding(10))
//
                                    NavigationLink(destination: UserProfileView(user: user).padding(10), label: {
                                        HStack {
                                                Image(colorScheme == .dark ? user.bio[0] : user.bio[1])//URLImage(url: URL(string: user.profileImageUrl)!,
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                //.clipShape(Circle())
                                            }.frame(width: 50, height: 50)
                                            VStack(alignment: .leading, spacing: 5) {
                                                Text(user.username).font(.headline).bold()
                                                Text("Mushfeed User").font(.subheadline)
                                            }
                                    })
                                    
                                  
                              }
                          }
                     
                     
                      }
                  }.navigationBarTitle(Text("Search"), displayMode: .inline)
      }
  }


struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
