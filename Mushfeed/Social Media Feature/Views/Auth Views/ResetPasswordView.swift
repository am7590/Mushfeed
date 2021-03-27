//
//  ResetPasswordView.swift
//  Mushfeed
//
//  Created by Alek Michelson on 3/27/21.
//

import SwiftUI

struct ResetPasswordView: View {
    @State private var email: String = ""
    @State private var showAlert = false
    @State private var errorString : String?
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("Enter Email", text:$email)
                Button(action: {
                    ResetPasswordViewModel.resetPassword(email: email) { (result) in
                        switch result {
                        case .failure(let error):
                            self.errorString = error.localizedDescription
                        case .success(_):
                            break
                        }
                        self.showAlert = true
                    }
                }) {
                    Text("Reset Password")
                }
            }
            .alert(isPresented: $showAlert){
                Alert(title: Text("Password Reset"), message: Text(self.errorString ?? "Success. Check your email and spam folder."), dismissButton: .default(Text("OK")) {
                    self.presentationMode.wrappedValue.dismiss()
                })
            }
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
