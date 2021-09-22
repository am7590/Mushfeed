//
//  ContentView.swift
//  Mushfeed
//
//  Created by Alek Michelson on 2/27/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
               HomeView().tabItem({
                       Image(systemName: "house.fill")
               }).tag(0)
//                GrowHome().tabItem({
//                    Image(systemName: "doc.text.magnifyingglass")
//                }).tag(1)
               IndexHome().navigationViewStyle(DoubleColumnNavigationViewStyle()).tabItem({
                   Image(systemName: "list.bullet.below.rectangle")
               }).tag(1)
               GrowHome().navigationViewStyle(DoubleColumnNavigationViewStyle()).tabItem({
                   Image(systemName: "doc.text.magnifyingglass")
               }).tag(3)
            ProfileView(navigateToProfile: false).tabItem({
                   Image(systemName: "ellipsis.circle")
               }).tag(2)
           }.accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
