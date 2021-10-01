//
//  SearchView.swift
//  instagram
//
//  Created by Alek Michelson on 8/5/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import SwiftUI
import FirebaseAuth

func seeLoginInfo() -> Bool {
    if let providerData = Auth.auth().currentUser?.providerData {
        for userInfo in providerData {
            switch userInfo.providerID {
                  case "apple.com":
                      print("Apple Login")
                    return true
                      //isVerifiededUser = true
                  default:
                      print("provider is \(userInfo.providerID)")
                  }
        }
    }
    return false
}

struct SearchView: View {
        @EnvironmentObject var session: SessionStore
        @ObservedObject var postPopularViewModel = PostPopularViewModel()
        @State var selection: Selection = .table
        @ObservedObject var signupViewModel = SignupViewModel()
        @Environment(\.colorScheme) var colorScheme
        @State var select: Int? = nil
    
        var body: some View {
            return
                NavigationView {
                    ScrollView {
                        
                        
                        if(self.session.userSession == nil && seeLoginInfo() == true && ((session.userSession?.bio[0].isEmpty) == nil)) {
                            VStack {
                                    
                                ScrollView{
                                VStack { //colorScheme == .dark ? session.userSession!.bio[1] : session.userSession!.bio[0]
                                    SelectPFPView(imageName: colorScheme == .dark ? $signupViewModel.imageName : $signupViewModel.imageName)

                                    }
                                Text("Tap on a mushroom to set your profile picture").font(.headline).fontWeight(.bold).foregroundColor(.gray).multilineTextAlignment(.center).padding().fixedSize(horizontal: false, vertical: true)
                                    
                                    UsernameTextField(username: $signupViewModel.username)

                                    VStack {
                                        
                                    NavigationLink(destination: Welcome(), tag: 1, selection: $select){
                                        SignupButton(action: {
                                                    let username: String = signupViewModel.username
                                                    //print("Sign up imageData: ", self.signupViewModel.imageData)
                                                    //signupViewModel.signup(username: signupViewModel.username, email: Auth.auth().currentUser?.email ?? "", password: "", imageData: signupViewModel.imageData, completed: { (user) in
                                                        //print(user.email)
                                                        //print(imageData)
                                                        //self.clean()
                                                        //self.session.logout()
                                                        
                                                        guard let userId = Auth.auth().currentUser?.uid else { return }
                                                                    print("Auth.auth().currentUser?.uid")
                                                                    
                                                                            if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
                                                                                //changeRequest.photoURL = url
                                                                                changeRequest.displayName = username
                                                                                changeRequest.commitChanges { (error) in
                                                                                    if error != nil {
                                                                                       //onError(error!.localizedDescription)
                                                                                        print("\n\n\n Change request error")
                                                                                       return
                                                                                    }
                                                                                }
                                                                            
                                                                    
                                                                    
                                                                        
                                                                        let firestoreUserId = Ref.FIRESTORE_DOCUMENT_USERID(userId: userId)
                                                                                let user = User.init(uid: userId, email: Auth.auth().currentUser?.email ?? "", profileImageUrl: "", username: username, bio: signupViewModel.imageName, keywords: username.splitStringToArray())
                                                                        guard let dict = try? user.toDictionary() else {
                                                                            print("\n\n\n Dictionary error")
                                                                            return
                                                                            
                                                                        }

                                                                        firestoreUserId.setData(dict) { (error) in
                                                                            if error != nil {
                                                                                //onError(error!.localizedDescription)
                                                                                print("\n\n\n Firestore UID error")
                                                                                return
                                                                            }
                                                                            //onSuccess(user)
                                                                            self.session.listenAuthenticationState()
                                                                        }
                                                                    }
                                                        
                                                        
                                            self.select = 1
                                        }, label: "Save").shadow(color: Color.secondary, radius: 10).alert(isPresented: $signupViewModel.showAlert) {
                                                    Alert(title: Text("Error"), message: Text(self.signupViewModel.errorString), dismissButton: .default(Text("OK")))
                                        }.padding(.bottom, 15)
                                    }
                               
                                    }
                                    
                                    
                                //}
                            }
                                
                               
                                    }
                        } else {
                            
                            Picker(selection: $selection, label: Text("Grid or Table")) {
                            ForEach(Selection.allCases) { selection in
                                    selection.image.tag(selection)
                                            
                                }
                            }.pickerStyle(SegmentedPickerStyle()).padding()
                            if !postPopularViewModel.isLoading {
                                  if selection == .grid {
                                      GridPosts(splitted: self.postPopularViewModel.splitted)
                                  } else {
                                      if(self.postPopularViewModel.posts.count != 0) {
                                          ForEach(self.postPopularViewModel.posts, id: \.postId) { post in
                                              VStack {
                                                  HeaderCell(post: post)
                                                  FooterCell(post: post)
                                              }
                                          }
                                      } else {
//                                          self.postPopularViewModel.loadPostPopular()
//                                          ForEach(self.postPopularViewModel.posts, id: \.postId) { post in
//                                              VStack {
//                                                  HeaderCell(post: post)
//                                                  FooterCell(post: post)
//                                              }
//                                          }
                                          Button("Load Posts", action: {
                                              self.postPopularViewModel.loadPostPopular()
                                          }
)                                      }
                                      
                                      
                                     
                                  }
                              
                            }
                        }
                        }.navigationBarTitle(Text("Mushfeed"), displayMode: .inline).onAppear {
                            self.postPopularViewModel.loadPostPopular()
                            
                        }.navigationBarItems(trailing: Button(action: {}) {
                            if(session.userSession?.bio[0] == nil){
                                NavigationLink(destination: ProfileView(navigateToProfile: false).navigationViewStyle(StackNavigationViewStyle())) {
                                    Image(systemName: "").imageScale(Image.Scale.large).foregroundColor(.primary)
                                }
                            } else {
                                NavigationLink(destination: CameraView().navigationViewStyle(StackNavigationViewStyle())) {
                                    Image(systemName: "plus").imageScale(Image.Scale.large).foregroundColor(.primary)
                                }
                            }
                            
                   }
                )}
               
        
        }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
