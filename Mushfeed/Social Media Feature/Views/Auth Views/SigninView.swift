//
//  ContentView.swift
//  instagram
//
//  Created by Alek Michelson on 7/22/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//
                    
import SwiftUI
import AuthenticationServices
import CryptoKit
import FirebaseAuth

struct SigninView: View {
    
    @AppStorage("email") var storageEmail: String = ""
    @AppStorage("username") var storageUsername: String = ""
    @AppStorage("userId") var storageUserId: String = ""
    @ObservedObject var signinViewModel = SigninViewModel()
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
                      
                        
                        
                          print("\(String(describing: Auth.auth().currentUser?.uid))")
                  default:
                      break
                              
                          }
                 default:
                      break
              }
}
    
    
    
    func signIn() {
        signinViewModel.signin(email: signinViewModel.email, password: signinViewModel.password, completed: { (user) in
            print("Login: \(user.email)")
            self.clean()
        }) { (errorMessage) in
            print("Error: \(errorMessage)")
            self.signinViewModel.showAlert = true
            self.signinViewModel.errorString = errorMessage
            self.clean()
        }
        
    }
    
    func clean(){
        self.signinViewModel.email = ""
        self.signinViewModel.password = ""
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
    

    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack {
                    Group {
                        HStack {
                            Image(colorScheme == .dark ? "pfp4b" : "pfp4w").resizable().aspectRatio(contentMode: .fill).frame(width: 120, height: 120).clipShape(Circle())
                            Image(colorScheme == .dark ? "pfp3b" : "pfp3w").resizable().aspectRatio(contentMode: .fill).frame(width: 120, height: 120).clipShape(Circle())
                            Image(colorScheme == .dark ? "pfp5b" : "pfp5w").resizable().aspectRatio(contentMode: .fill).frame(width: 120, height: 120).clipShape(Circle())
                        }
        
                        Text(TEXT_SIGNIN_HEADLINE).font(Font.title).padding(.bottom)
                        Text("The ultimate app for gourmet mushroom lovers")
                            .font(Font.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(TextAlignment.center)
                    }
                Spacer()
                Divider()
                EmailTextField(email: $signinViewModel.email)
                PasswordTextField(password: $signinViewModel.password)
                    
                HStack{
                    Button(action: {}) {
                        NavigationLink(destination: ResetPasswordView()){
                            Text("Forgot Password?").foregroundColor(.primary)
                
                        }
                    }
                    Spacer()
                }.padding(.leading)
                    
                SignInButton(action: signIn, label: "Sign in").alert(isPresented: $signinViewModel.showAlert){
                    Alert(title: Text("Error"), message: Text(self.signinViewModel.errorString), dismissButton: .default(Text("OK")))
                    }
                    
                    //NavigationLink(destination: SignUpForApple()){
                    SignInWithAppleButton(.signIn, onRequest: configure, onCompletion: handle).padding(.leading).padding(.trailing).frame(height: 50).signInWithAppleButtonStyle(colorScheme == .dark ? .white : .black)
                   // }
                
                    //.border(Color.gray, width: 1)
                                //.padding([.top, .leading, .trailing])
                
                    
                    
                    //Divider()
                    NavigationLink(destination: SignupView()) {
                      SignUpText().navigationViewStyle(StackNavigationViewStyle())
                    }.padding(.top, 10)
                
                    }
            }
            
        
        }
        Spacer()
            }
    }



struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
 








