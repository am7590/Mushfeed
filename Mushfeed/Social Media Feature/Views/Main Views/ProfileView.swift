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
    @ObservedObject var signupViewModel = SignupViewModel()
    @State var selection: Selection = .grid
    @Environment(\.openURL) var openURL
    
    func listen() {
        session.listenAuthenticationState()
    }
       var body: some View {
         
         return
             NavigationView {
                 ScrollView {
                    
                    
                    
//                    if let providerData = Auth.auth().currentUser?.providerData {
//                        for userInfo in providerData {
//                            switch userInfo.providerID {
//                            case "facebook.com":
//                                print("Facebook Login")
//                                //isVerifiededUser = true
//                            default:
//                                print("provider is \(userInfo.providerID)")
//                            }
//                        }
//                    }
                    
                    
                    
                    if(self.session.userSession == nil && profileViewModel.seeLoginInfo() == true){
                        
                        //SignUpForApple(areYouGoingToSecondView: true)
                        VStack {
                                    NavigationLink(destination: DetailView())
                                    { Text("Welcome to Mushfeed!\nClick here to set your username and profile pic.") }
                                }
                        
                        
                        
                        
                        
                    
                    } else if(self.session.userSession == nil){
                        
                        Text("Account not recognized.")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top, 5)
                        
                        Text("If you were a beta tester, your account was deleted.")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top, 5)

                        
                        Text("Please log in again or make a new account.")
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
                        PfpProfileView()
                 }
             }//.navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(self.session)
            
       
             }
       }


}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}



struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        SignUpForApple(areYouGoingToSecondView: true)
        
        
    }
}


struct PfpProfileView: View {
    
    @EnvironmentObject var session: SessionStore
    @ObservedObject var profileViewModel = ProfileViewModel()
    @ObservedObject var signupViewModel = SignupViewModel()
    @State var selection: Selection = .grid
    @Environment(\.openURL) var openURL
    
    var body: some View {
        return VStack(alignment: .center) {
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
            //                                    Button(action: {}) {
            //
            //                                            .frame(maxWidth: .infinity)
            //                                        .padding().background(Color.primary).cornerRadius(5).shadow(radius: 10, x: 0, y: 10)
            //
            //                                    }.cornerRadius(5)
            //                                    NavigationLink (destination: UsersView()){
            //                                        HStack {
            //                                            Text("Search Users")
            //                                                .fontWeight(.bold)
            //                                                .foregroundColor(Color(UIColor.systemBackground))
            //                                        }
            //                                    } //frame(height: 15)
                                                
                                                Button(action: {
                                                    print("Floating Button Click")
                                                }, label: {
                                                    NavigationLink(destination: UsersView()) {
                                                        HStack{
                                                            Text("Search Users")
                                                                .fontWeight(.bold)
                                                                .foregroundColor(Color(UIColor.systemBackground))
                                                        }.frame(maxWidth: .infinity)
                                                        .frame(height: 15)
                                                    .padding().background(Color.primary).cornerRadius(5).shadow(radius: 10, x: 0, y: 10)
                                                     }
                                                }).cornerRadius(5)
                                                
            //                                    Button(action: print("Search Users Button Clicked"), label: {
            //                                            NavigationLink (destination: UsersView()){
            //                                                HStack {
            //                                                    Text("Search Users")
            //                                                        .fontWeight(.bold)
            //                                                        .foregroundColor(Color(UIColor.systemBackground))
            //                                                }
            //                                    }})
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
    }
}
