//
//  MushfeedApp.swift
//  Mushfeed
//
//  Created by Alek Michelson on 2/27/21.
//

import SwiftUI
import Firebase

@main
struct MushfeedApp: App {
    var sessionStore = SessionStore()
    
    
    var body: some Scene {
        WindowGroup {
            InitialView().environmentObject(SessionStore())
        }
    }
}
