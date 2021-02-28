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


    var body: some View {
                VStack {
                    SearchBar(text: $usersViewModel.searchText, onSearchButtonChanged: usersViewModel.searchTextDidChange)

                    List {
                        if !usersViewModel.isLoading {

                                ForEach(usersViewModel.users, id: \.uid) { user in
                                    NavigationLink(destination: UserProfileView(user: user)) {
                                        HStack {
                                            URLImage(url: URL(string: user.profileImageUrl)!,
                                        content: { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .clipShape(Circle())
                                        }).frame(width: 50, height: 50)
                                            VStack(alignment: .leading, spacing: 5) {
                                             Text(user.username).font(.headline).bold()
                                                Text("IOS Developer").font(.subheadline)
                                            }
                                          
                                        }.padding(10)
                               }
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
