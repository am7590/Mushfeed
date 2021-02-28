//
//  InitialView.swift
//  instagram
//
//  Created by Alek Michelson on 8/3/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import Foundation
import SwiftUI

struct InitialView: View {
    
    @EnvironmentObject var session: SessionStore
    
    func listen() {
        session.listenAuthenticationState()
    }
    
    var body: some View {
        Group {
            if session.isLoggedIn {
                MainView()
            } else {
                SigninView()
            }

        }.onAppear(perform: listen)
    }
}
