//
//  ContentView.swift
//  instagram
//
//  Created by Alek Michelson on 7/22/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//
                    
import SwiftUI

struct SigninView: View {
    
    @ObservedObject var signinViewModel = SigninViewModel()
    
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
            VStack {
            Spacer()
                Group {
                    HStack {
                        Image("icon2").resizable().aspectRatio(contentMode: .fill).frame(width: 80, height: 80)
                        Image("icon3").resizable().aspectRatio(contentMode: .fill).frame(width: 80, height: 80)
                        Image("icon1").resizable().aspectRatio(contentMode: .fill).frame(width: 80, height: 80)
                    }
    
                    Text(TEXT_SIGNIN_HEADLINE).font(Font.title).padding(.bottom)
                    Text("Create an account or sign in below")
                        .font(Font.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(TextAlignment.center)
                }
            Spacer()
            Divider()
            EmailTextField(email: $signinViewModel.email)
            PasswordTextField(password: $signinViewModel.password)
            SignInButton(action: signIn, label: "Sign in").alert(isPresented: $signinViewModel.showAlert){
                Alert(title: Text("Error"), message: Text(self.signinViewModel.errorString), dismissButton: .default(Text("OK")))
                }
                Divider()
                NavigationLink(destination: SignupView()) {
                  SignUpText()
                }
            
            
                }
        }.accentColor(Color.black)
        }
    }



struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
 












