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
    //@Binding var imageName: [String]
    
    
    func signUp() {
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
                                           return
                                        }
                                    }
                                
                        
                        
                            
                            let firestoreUserId = Ref.FIRESTORE_DOCUMENT_USERID(userId: userId)
                                    let user = User.init(uid: userId, email: Auth.auth().currentUser?.email ?? "", profileImageUrl: "", username: username, bio: signupViewModel.imageName, keywords: username.splitStringToArray())
                            print("\n\n\n It WORKED \n\n\n")
                            
                            guard let dict = try? user.toDictionary() else {return}
        //
        //                        guard let decoderUser = try? User.init(fromDictionary: dict) else {return}
        //                        print(decoderUser.username)
                            
                            firestoreUserId.setData(dict) { (error) in
                                if error != nil {
                                    //onError(error!.localizedDescription)
                                    return
                                }
                                //onSuccess(user)
                            }
                        }
            
            
            // Switch to the Main App
        
    }
    
    func clean() {
        self.signupViewModel.username = ""
        self.signupViewModel.email = ""
        self.signupViewModel.password = ""
    }
    
    
    var body: some View {
        VStack { //colorScheme == .dark ? session.userSession!.bio[1] : session.userSession!.bio[0]
            SelectPFPView(imageName: colorScheme == .dark ? $signupViewModel.imageName : $signupViewModel.imageName)
            // Old image picker code
//            signupViewModel.image.resizable().aspectRatio(contentMode: .fill).frame(width: 80, height: 80)
//                .clipShape(Circle()).padding(.bottom, 80)
//                .onTapGesture {
//                    print("Tapped")
//                    self.signupViewModel.showImagePicker = true
            
            
            }
        Text("Tap on a mushroom to set your profile picture").font(.headline).fontWeight(.bold).foregroundColor(.gray).multilineTextAlignment(.center).padding().fixedSize(horizontal: false, vertical: true)
            
            UsernameTextField(username: $signupViewModel.username)
            //EmailTextField(email: $signupViewModel.email)
//            VStack(alignment: .leading) {
//                PasswordTextField(password: $signupViewModel.password)
//                Text(TEXT_SIGNUP_PASSWORD_REQUIRED).font(.footnote).foregroundColor(.gray).padding([.leading])
//            }
            
        SignupButton(action: signUp, label: "Continue").alert(isPresented: $signupViewModel.showAlert) {
                Alert(title: Text("Error"), message: Text(self.signupViewModel.errorString), dismissButton: .default(Text("OK")))
            }
        
        
    }
}

//struct SignUpForApple_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUpForApple()
//    }
//}
