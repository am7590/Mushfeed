//
//  SignupView.swift
//  instagram
//
//  Created by Alek Michelson on 7/26/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import SwiftUI
import AuthenticationServices



struct SignupView: View {

    @ObservedObject var signupViewModel = SignupViewModel()
    @EnvironmentObject var session: SessionStore
    @State var imageData: Data = Data()
    @Environment(\.colorScheme) var colorScheme  
    
    func configure(_ request: ASAuthorizationAppleIDRequest){
        
    }
    
    
    func handle(_ authRequest: Result<ASAuthorization, Error>){
        
    }
    
    
    func signUp() {
        //print("Sign up imageData: ", self.signupViewModel.imageData)
        signupViewModel.signup(username: signupViewModel.username, email: signupViewModel.email, password: signupViewModel.password, imageData: signupViewModel.imageData, completed: { (user) in
            print(user.email)
            print(imageData)
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
    
    var body: some View {
        ScrollView{
            
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
                EmailTextField(email: $signupViewModel.email)
                VStack(alignment: .leading) {
                    PasswordTextField(password: $signupViewModel.password)
                    Text(TEXT_SIGNUP_PASSWORD_REQUIRED).font(.footnote).foregroundColor(.gray).padding([.leading])
                }
                SignupButton(action: signUp, label: TEXT_SIGN_UP).alert(isPresented: $signupViewModel.showAlert) {
                    Alert(title: Text("Error"), message: Text(self.signupViewModel.errorString), dismissButton: .default(Text("OK")))
                }
            
            SignInWithAppleButton(.signUp, onRequest: configure, onCompletion: handle).padding(.leading).padding(.trailing).frame(height: 50).signInWithAppleButtonStyle(colorScheme == .dark ? .white : .black)
            
            
                //Divider()
                Text("Mushfeed needs your email only for account recovery purposes.").font(.footnote).foregroundColor(.gray).padding().lineLimit(nil)
                
            }//.sheet(isPresented: $signupViewModel.showImagePicker) {
               // ImagePickerController()
    //            ImagePicker(showImagePicker: self.$signupViewModel.showImagePicker, pickedImage: self.$signupViewModel.image, imageData: self.$signupViewModel.imageData)
            //}
            //.navigationBarTitle("Register", displayMode: .inline).foregroundColor(.primary)
        //}
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
