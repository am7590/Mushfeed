//
//  HomeView.swift
//  instagram
//
//  Created by Alek Michelson on 8/4/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var homeViewModel = HomeViewModel()
     
    var body: some View {
        NavigationView {
           ScrollView {
               Story()
                if !homeViewModel.isLoading {
                    ForEach(self.homeViewModel.posts, id: \.postId) { post in
                          VStack {
                              HeaderCell(post: post)
                              FooterCell(post: post)
                          }
                      }
                }
              
           }.navigationBarTitle(Text("Mushfeed"), displayMode: .inline).onAppear {
                 self.homeViewModel.loadTimeline()
             }.navigationBarItems(trailing: Button(action: {}) {
                      NavigationLink(destination: CameraView()) {
                          Image(systemName: "plus").imageScale(Image.Scale.large).foregroundColor(.black)
                      }
             }).onDisappear {
                if self.homeViewModel.listener != nil {
                    self.homeViewModel.listener.remove()
                }
             }
           
       }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}




