//
//  ProfileView.swift
//  instagram
//
//  Created by Alek Michelson on 8/7/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import SwiftUI
import URLImage
import FirebaseAuth

struct ProfileView: View {
    
    @EnvironmentObject var session: SessionStore
    @ObservedObject var profileViewModel = ProfileViewModel()

    @State var selection: Selection = .grid
    @Environment(\.openURL) var openURL

       var body: some View {
         
         return
             NavigationView {
                 ScrollView {
                    VStack(alignment: .center) {
                     ProfileHeader(user: self.session.userSession)
                     ProfileInformation(user: self.session.userSession)
                     Divider().padding(.leading, 15).padding(.trailing, 15)
                        
                        VStack(alignment: .leading) {
                            Text("Posts")
                                .font(.title)
                                    .fontWeight(.bold)

                               
                               
                                 Picker(selection: $selection, label: Text("Grid or Table")) {
                                    ForEach(Selection.allCases) { selection in
                                        selection.image.tag(selection)
                                                
                                    }
                                 }.pickerStyle(SegmentedPickerStyle()).padding(.trailing, 15)
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
                            
                            Text("Options")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.top, 5)
                            
                            // Edit, Search, Log out button stack
                            
                            VStack(spacing: 5) {
                                
                                // Edit Profile
                                Button(action: {}) {
                                    HStack {
                                        Text("Edit Profile Pic").fontWeight(.bold).foregroundColor(Color(UIColor.systemBackground))
                                    }.frame(maxWidth: .infinity)
                                        .frame(height: 30)
                                        .background(Color.primary)
                                
                                    

                                }.cornerRadius(5)
                                
                                // Search Users button
                                Button(action: {}) {
                                    HStack {
                                        NavigationLink(destination: UsersView()) {
                                            Text("Search Users")
                                                .fontWeight(.bold)
                                                .foregroundColor(Color(UIColor.systemBackground))
                                        }
                                    }.frame(height: 30)
                                        .frame(maxWidth: .infinity)
                                        .background(Color.primary)
                                        
                                }.cornerRadius(5)
                                
                                
                                
                                // Log out
                                Button(action: {self.session.logout()}) {
                                    HStack {
                                            Text("Log Out").fontWeight(.bold).foregroundColor(Color(UIColor.systemBackground))
                                    }.frame(maxWidth: .infinity)
                                        .frame(height: 30)
                                        .background(Color.primary)
                                    
                                }.cornerRadius(5)
                            }.padding(.top, 5)
                            
                            
                            // More
                            Text("Surveys")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.top, 5)

                                
                            // Survey Button stack
                            VStack(spacing: 5) {
                                
                                // Request Mushroom
                                Button(action: {openURL(URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSeOnTonAFPEHUVj3HOekPVGlaA7rJn3vF9r0ZuCY_rQolkHaA/viewform")!)}) {
                                    HStack {
                                        Text("Request a Mushroom").fontWeight(.bold).foregroundColor(Color(UIColor.systemBackground))
                                    }
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 30)
                                    .background(Color.primary)
                                    
                                    
                                }.cornerRadius(5).padding(.top, 5)
                                
                                // User Survey
                                Button(action: {openURL(URL(string: "https://docs.google.com/forms/d/e/1FAIpQLScCkPctbaHkRNXiZRNQ8smrHlQiFgNFvibBy139LLxYp0Xssw/viewform")!)}) {
                                    HStack {
                                        Text("Mushfeed User Survey").fontWeight(.bold).foregroundColor(Color(UIColor.systemBackground))
                                    }
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 30)
                                    .background(Color.primary)
                                    
                                    
                                }
                                    
                                    
                            }.padding(.top, 5)
                        
                            
                            

                        }.padding(.leading, 15).padding(.trailing, 15)
                     

                        
                    }.padding(.top, 20)
                                  
                     }.navigationBarTitle(Text("Profile"), displayMode: .inline).onAppear {
                         self.profileViewModel.loadUserPosts(userId: Auth.auth().currentUser!.uid)
                 } // IMPORTANT ^ loads user posts
             }.navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(self.session)
            
       
         
     }

}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

