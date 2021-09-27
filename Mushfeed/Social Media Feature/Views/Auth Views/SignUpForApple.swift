//
//  SignUpForApple.swift
//  Mushfeed
//
//  Created by Alek Michelson on 9/18/21.
//

import SwiftUI
import AuthenticationServices
import CryptoKit
import FirebaseAuth

struct SignUpForApple: View {
    
    @ObservedObject var signupViewModel = SignupViewModel()
    @EnvironmentObject var session: SessionStore
    @State var imageData: Data = Data()
    @Environment(\.colorScheme) var colorScheme
    @State var areYouGoingToSecondView: Bool // Step 2
    @State var navigateToProfile : Bool
    @State var selection: Int? = nil
    //@Binding var imageName: [String]
    
    func listen() {
        session.listenAuthenticationState()
    }
    

    func clean() {
        self.signupViewModel.username = ""
        self.signupViewModel.email = ""
        self.signupViewModel.password = ""
    }
    
    
    var body: some View {
        
        ScrollView{
        VStack { //colorScheme == .dark ? session.userSession!.bio[1] : session.userSession!.bio[0]
            SelectPFPView(imageName: colorScheme == .dark ? $signupViewModel.imageName : $signupViewModel.imageName)

            }
        Text("Tap on a mushroom to set your profile picture").font(.headline).fontWeight(.bold).foregroundColor(.gray).multilineTextAlignment(.center).padding().fixedSize(horizontal: false, vertical: true)
            
            UsernameTextField(username: $signupViewModel.username)

            VStack {
            NavigationLink(destination: ProfileView(navigateToProfile: false)){
                SignupButton(action: {
                                        selection = 1
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
                                                    listen()
                                                    self.navigateToProfile = true
                                                    self.navigateToProfile = true
                                                    self.session.listenAuthenticationState()
                                                    listen()
                                                }
                                            }
                                
                                
                            
                }, label: selection == nil ? "Save" : "Go to Mushfeed").shadow(color: selection == nil ? Color.secondary : Color.red, radius: 10).alert(isPresented: $signupViewModel.showAlert) {
                            Alert(title: Text("Error"), message: Text(self.signupViewModel.errorString), dismissButton: .default(Text("OK")))
                }.padding(.bottom, 15)
            }
       
            }
            
            
        //}
    }
    }
}

//struct SignUpForApple_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUpForApple()
//    }
//}
