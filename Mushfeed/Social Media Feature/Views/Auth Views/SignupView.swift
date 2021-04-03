//
//  SignupView.swift
//  instagram
//
//  Created by Alek Michelson on 7/26/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import SwiftUI



struct SignupView: View {

    @ObservedObject var signupViewModel = SignupViewModel()
    
    func signUp() {
        signupViewModel.signup(username: signupViewModel.username, email: signupViewModel.email, password: signupViewModel.password, imageData: signupViewModel.imageData, completed: { (user) in
            print(user.email)
            self.clean()
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
        VStack {
            SelectPFPView()
            // Old image picker code
//            signupViewModel.image.resizable().aspectRatio(contentMode: .fill).frame(width: 80, height: 80)
//                .clipShape(Circle()).padding(.bottom, 80)
//                .onTapGesture {
//                    print("Tapped")
//                    self.signupViewModel.showImagePicker = true
            
            
            }
            Text("Select a profile picture").font(.footnote).foregroundColor(.gray).padding().lineLimit(nil).padding(.top, 0)
            
            UsernameTextField(username: $signupViewModel.username)
            EmailTextField(email: $signupViewModel.email)
            VStack(alignment: .leading) {
                PasswordTextField(password: $signupViewModel.password)
                Text(TEXT_SIGNUP_PASSWORD_REQUIRED).font(.footnote).foregroundColor(.gray).padding([.leading])
            }
            SignupButton(action: signUp, label: TEXT_SIGN_UP).alert(isPresented: $signupViewModel.showAlert) {
                Alert(title: Text("Error"), message: Text(self.signupViewModel.errorString), dismissButton: .default(Text("OK")))
            }
            Divider()
            Text("Mushfeed needs your email only for account recovery purposes. ").font(.footnote).foregroundColor(.gray).padding().lineLimit(nil)
            
        }//.sheet(isPresented: $signupViewModel.showImagePicker) {
           // ImagePickerController()
//            ImagePicker(showImagePicker: self.$signupViewModel.showImagePicker, pickedImage: self.$signupViewModel.image, imageData: self.$signupViewModel.imageData)
        //}
        //.navigationBarTitle("Register", displayMode: .inline).foregroundColor(.primary)
    //}
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
