//
//  MainView.swift
//  instagram
//
//  Created by Alek Michelson on 8/3/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//
//Users/alekmichelson/Desktop/SwiftUIProject/instagram/instagram/View/Main/MainView.swift
import Foundation
import SwiftUI

struct MainView: View {
    @EnvironmentObject var session: SessionStore
    func logout() {
        session.logout()
    }
    
    var body: some View {
         TabView {
                HomeView().tabItem({
                        Image(systemName: "house.fill")
                }).tag(0)
//                GrowHome().tabItem({
//                    Image(systemName: "doc.text.magnifyingglass")
//                }).tag(1)
                IndexHome().tabItem({
                    Image(systemName: "list.bullet.below.rectangle")
                }).tag(1)
                GrowHome().tabItem({
                    Image(systemName: "doc.text.magnifyingglass")
                }).tag(3)
                ProfileView().tabItem({
                    Image(systemName: "ellipsis.circle")
                }).tag(2)
            }.accentColor(.black)
                
        //        Group {
        //            Text((session.userSession == nil) ? "Loading..." : session.userSession!.email)
        //            Button(action: logout) {
        //               Text("Log out")
        //            }
        //        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
