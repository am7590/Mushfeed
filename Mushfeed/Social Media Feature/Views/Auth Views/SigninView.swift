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
    @Environment(\.colorScheme) var colorScheme
    
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
                Divider()
                NavigationLink(destination: SignupView()) {
                  SignUpText().navigationViewStyle(StackNavigationViewStyle())
                }
            
            
                }
        }.accentColor(Color.primary).foregroundColor(.primary)
        }
    }



struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
 












