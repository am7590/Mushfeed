//
//  SignupView.swift
//  instagram
//
//  Created by Alek Michelson on 7/26/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import SwiftUI
import AuthenticationServices
import CryptoKit
import FirebaseAuth



struct SignupView: View {

    @ObservedObject var signupViewModel = SignupViewModel()
    @EnvironmentObject var session: SessionStore
    @State var imageData: Data = Data()
    @Environment(\.colorScheme) var colorScheme  
    
    
    
    func configure(_ request: ASAuthorizationAppleIDRequest){
        let nonce = randomNonceString()
        currentNonce = nonce
        request.requestedScopes = [.fullName, .email]
        request.nonce = sha256(nonce)
    }
    

    func handle(_ authResult: Result<ASAuthorization, Error>){
        switch authResult {
              case .success(let authResults):
                  switch authResults.credential {
                      case let appleIDCredential as ASAuthorizationAppleIDCredential:
                      
                              guard let nonce = currentNonce else {
                                fatalError("Invalid state: A login callback was received, but no login request was sent.")
                              }
                              guard let appleIDToken = appleIDCredential.identityToken else {
                                  fatalError("Invalid state: A login callback was received, but no login request was sent.")
                              }
                              guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                                print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                                return
                              }
                             
                              let credential = OAuthProvider.credential(withProviderID: "apple.com",idToken: idTokenString,rawNonce: nonce)
                              Auth.auth().signIn(with: credential) { (authResult, error) in
                                  if (error != nil) {
                                      // Error. If error.code == .MissingOrInvalidNonce, make sure
                                      // you're sending the SHA256-hashed nonce as a hex string with
                                      // your request to Apple.
                                      print(error?.localizedDescription as Any)
                                      return
                                  }
                                  print("signed in")
                                  
                                
                                
                                
                              }
                      
                        
                        
                          //print("\(String(describing: Auth.auth().currentUser?.uid))")
                  default:
                      break
                              
                          }
                 default:
                      break
              }
    }
    
    
    
    
    func signUp() {
        //print("Sign up imageData: ", self.signupViewModel.imageData)
        signupViewModel.signup(username: signupViewModel.username, email: signupViewModel.email, password: signupViewModel.password, imageData: signupViewModel.imageData, completed: { (user) in
            print(user.email)
            //print(imageData)
            self.clean()
            //self.session.logout()
            
            
            // Switch to the Main App
        }) { (errorMessage) in
            print("Error: \(errorMessage)")
            self.signupViewModel.showAlert = true
            self.signupViewModel.errorString = errorMessage
            self.clean()
        }
    }
    
    func clean() {
        self.signupViewModel.username = ""
        self.signupViewModel.email = ""
        self.signupViewModel.password = ""
    }
    
    
    @State var currentNonce:String?
        
        //Hashing function using CryptoKit
        func sha256(_ input: String) -> String {
            let inputData = Data(input.utf8)
            let hashedData = SHA256.hash(data: inputData)
            let hashString = hashedData.compactMap {
            return String(format: "%02x", $0)
            }.joined()

            return hashString
        }
    
    // from https://firebase.google.com/docs/auth/ios/apple
    private func randomNonceString(length: Int = 32) -> String {
      precondition(length > 0)
      let charset: Array<Character> =
          Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
      var result = ""
      var remainingLength = length

      while remainingLength > 0 {
        let randoms: [UInt8] = (0 ..< 16).map { _ in
          var random: UInt8 = 0
          let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
          if errorCode != errSecSuccess {
            fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
          }
          return random
        }

        randoms.forEach { random in
          if remainingLength == 0 {
            return
          }

          if random < charset.count {
            result.append(charset[Int(random)])
            remainingLength -= 1
          }
        }
      }

      return result
    }
    
    
    
    
    var body: some View {
        ScrollView{
            
            VStack {
                SelectPFPView(imageName: colorScheme == .dark ? $signupViewModel.imageName : $signupViewModel.imageName)

                }
            Text("Tap on a mushroom to set your profile picture (scroll to see more)").font(.headline).fontWeight(.bold).foregroundColor(.gray).multilineTextAlignment(.center).padding().fixedSize(horizontal: false, vertical: true)
                
                UsernameTextField(username: $signupViewModel.username)
                EmailTextField(email: $signupViewModel.email)
                VStack(alignment: .leading) {
                    PasswordTextField(password: $signupViewModel.password)
                    Text(TEXT_SIGNUP_PASSWORD_REQUIRED).font(.footnote).foregroundColor(.gray).padding([.leading])
                }
                SignupButton(action: signUp, label: TEXT_SIGN_UP).alert(isPresented: $signupViewModel.showAlert) {
                    Alert(title: Text("Error"), message: Text(self.signupViewModel.errorString), dismissButton: .default(Text("OK")))
                }
            
            SignInWithAppleButton(.signUp, onRequest: configure, onCompletion: handle).cornerRadius(13).padding(.leading).padding(.trailing).frame(height: 50).signInWithAppleButtonStyle(colorScheme == .dark ? .white : .black)

            
            
                //Divider()
                Text("Mushfeed needs your email only for account recovery purposes.").font(.footnote).foregroundColor(.gray).padding().lineLimit(nil)
                
            }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
