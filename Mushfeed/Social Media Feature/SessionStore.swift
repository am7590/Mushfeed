//
//  SessionStore.swift
//  instagram
//
//  Created by Alek Michelson on 8/3/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import Foundation
import Combine
import FirebaseAuth

class SessionStore: ObservableObject {
    
    @Published var isLoggedIn = false
    var userSession: User?
    var handle: AuthStateDidChangeListenerHandle?
    
    func listenAuthenticationState() {
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if let user = user {
                print(user.email!)
                let firestoreUserId = Ref.FIRESTORE_DOCUMENT_USERID(userId: user.uid)
                  firestoreUserId.getDocument { (document, error) in
                      if let dict = document?.data() {
                          guard let decoderUser = try? User.init(fromDictionary: dict) else {return}
                        self.userSession = decoderUser
                        
                      }
                  }
                self.isLoggedIn = true
            } else {
                print("isLoggedIn is false")
                self.isLoggedIn = false
                self.userSession = nil

            }
        })
    }
    
    
    func logout() {
        do {
            try Auth.auth().signOut()
            
        } catch  {
            print("Logout failed")
        }
    }
    
    // stop listening for auth changes
    func unbind() {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    deinit {
        unbind()
    }
}
