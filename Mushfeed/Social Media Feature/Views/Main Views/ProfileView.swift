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
                    
                    if(self.session.userSession == nil){
                        
                        Text("Account not recognized.")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top, 5)
                        
                        Text("Please log in again.")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.top, 5)
                        
                        // Log out
                        Button(action: {self.session.logout()}) {
                            HStack {
                                    Text("Log Out").fontWeight(.bold).foregroundColor(Color(UIColor.systemBackground))
                            }.frame(maxWidth: .infinity)
                                .frame(height: 15)
                            .padding().background(Color.gray).cornerRadius(5).shadow(radius: 10, x: 0, y: 10)
                            
                        }.cornerRadius(5)
                    } else {
                        VStack(alignment: .center) {
//                        ProfileHeader(user: self.session.userSession)
//                         ProfileInformation(user: self.session.userSession)
//                         Divider().padding(.leading, 15).padding(.trailing, 15)
                            VStack(alignment: .leading) {
                                
                                    UserProfileView(user: self.session.userSession!)
                                
                                
                                
                                
                                
                                Text("Options")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding(.top, 5)
                                
                                // Edit, Search, Log out button stack
                                
                                VStack() {
                                    
                                    // New Post
                                    Button(action: {}) {
                                        NavigationLink(destination: CameraView()) {
                                            HStack {
                                                Text("Create New Post").fontWeight(.bold).foregroundColor(Color(UIColor.systemBackground))
                                            }.frame(maxWidth: .infinity)
                                                .frame(height: 15)
                                            .padding().background(Color.primary).cornerRadius(5).shadow(radius: 10, x: 0, y: 10)
                                        }

                                    }.cornerRadius(5)
                                    
                                    // Search Users button
                                    Button(action: {}) {
                                        HStack {
                                            NavigationLink(destination: UsersView()) {
                                                Text("Search Users")
                                                    .fontWeight(.bold)
                                                    .foregroundColor(Color(UIColor.systemBackground))
                                            }
                                        }.frame(height: 15)
                                            .frame(maxWidth: .infinity)
                                        .padding().background(Color.primary).cornerRadius(5).shadow(radius: 10, x: 0, y: 10)
                                            
                                    }.cornerRadius(5)
                                    
                                    
                                    
                                    // Log out
                                    Button(action: {self.session.logout()}) {
                                        HStack {
                                                Text("Log Out").fontWeight(.bold).foregroundColor(Color(UIColor.systemBackground))
                                        }.frame(maxWidth: .infinity)
                                            .frame(height: 15)
                                        .padding().background(Color.primary).cornerRadius(5).shadow(radius: 10, x: 0, y: 10)
                                        
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
                                        .frame(height: 15)
                                        .padding().background(Color.primary).cornerRadius(5).shadow(radius: 10, x: 0, y: 10)
                                        
                                        
                                    }.cornerRadius(5).padding(.top, 5)
                                    
                                    // User Survey
                                    Button(action: {openURL(URL(string: "https://docs.google.com/forms/d/e/1FAIpQLScCkPctbaHkRNXiZRNQ8smrHlQiFgNFvibBy139LLxYp0Xssw/viewform")!)}) {
                                        HStack {
                                            Text("Mushfeed User Survey").fontWeight(.bold).foregroundColor(Color(UIColor.systemBackground))
                                        }
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 15)
                                        .padding().background(Color.primary).cornerRadius(5).shadow(radius: 10, x: 0, y: 10)
                                        
                                        
                                    }
                                        
                                        
                                }.padding(.top, 5)
                            
                                
                                

                            }
                         

                            
                        }.padding()
//                            VStack {
//                            Text("Please log in to verify your account.").font(.title)
//                                .fontWeight(.bold)
//
//
//                            // Log out
//                            Button(action: {self.session.logout()}) {
//                                HStack {
//                                        Text("Log in").fontWeight(.bold).foregroundColor(Color(UIColor.systemBackground))
//                                }.frame(maxWidth: .infinity)
//                                .frame(height: 15).padding()
//                                .background(Color.gray).cornerRadius(5).shadow(radius: 10, x: 0, y: 10)
//
//                            }.cornerRadius(5).padding(.top, 10)
//
//                                Text("Thank you for making an account on Mushfeed. Please log in to securely access your profile.").padding(.top, 10)
//                            }.padding(.leading, 15).padding(.trailing, 15).padding(.top, 10)
//                    }
//                     }.padding(.leading, 15).padding(.trailing, 15).navigationBarTitle(Text("Profile"), displayMode: .inline).onAppear {
//                         self.profileViewModel.loadUserPosts(userId: Auth.auth().currentUser!.uid)
//
//                 } // IMPORTANT ^ loads user posts
                 }
             }//.navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(self.session)
            
       
             }
       }

}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

