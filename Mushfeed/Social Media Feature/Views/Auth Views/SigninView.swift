//
//  ContentView.swift
//  instagram
//
//  Created by Alek Michelson on 7/22/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//
                    
import SwiftUI
import AuthenticationServices

struct SigninView: View {
    
    @AppStorage("email") var storageEmail: String = ""
    @AppStorage("username") var storageUsername: String = ""
    @AppStorage("userId") var storageUserId: String = ""
    

    
    @ObservedObject var signinViewModel = SigninViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    func configure(_ request: ASAuthorizationAppleIDRequest){
        request.requestedScopes = [.email, .fullName]
    }
    
    
    func handle(_ authResult: Result<ASAuthorization, Error>){
        switch authResult {
        case .success(let auth):
            print(auth)
            switch auth.credential {
            case let credential as ASAuthorizationAppleIDCredential:
                let userId = credential.user
                let email = credential.email
                let username = credential.fullName?.givenName
                //let lastname = credential.fullName?.familyName
                self.storageEmail = email ?? ""
                self.storageUserId = userId
                self.storageUsername = username ?? ""
                
                break
            default:
                break
            }
            break
        case .failure(let error):
            print(error)
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
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack {
                Spacer()
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
                    
                SignInWithAppleButton(.signIn, onRequest: configure, onCompletion: handle).padding(.leading).padding(.trailing).frame(height: 50).signInWithAppleButtonStyle(colorScheme == .dark ? .white : .black)
                    //.border(Color.gray, width: 1)
                                //.padding([.top, .leading, .trailing])
                
                    
                    
                    //Divider()
                    NavigationLink(destination: SignupView()) {
                      SignUpText().navigationViewStyle(StackNavigationViewStyle())
                    }.padding(.top, 10)
                
                
                    }
            }.accentColor(Color.primary).foregroundColor(.primary)
            
        
        }
        
            }
    }



struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
 












