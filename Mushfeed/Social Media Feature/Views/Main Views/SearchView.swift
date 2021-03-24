//
//  SearchView.swift
//  instagram
//
//  Created by Alek Michelson on 8/5/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import SwiftUI

struct SearchView: View {
        
        @ObservedObject var postPopularViewModel = PostPopularViewModel()
        @State var selection: Selection = .table
        var body: some View {
            return
                NavigationView {
                    ScrollView {
                            
                            Picker(selection: $selection, label: Text("Grid or Table")) {
                            ForEach(Selection.allCases) { selection in
                                    selection.image.tag(selection)
                                            
                                }
                            }.pickerStyle(SegmentedPickerStyle()).padding()
                            if !postPopularViewModel.isLoading {
                                  if selection == .grid {
                                      GridPosts(splitted: self.postPopularViewModel.splitted)
                                  } else {
                                      ForEach(self.postPopularViewModel.posts, id: \.postId) { post in
                                          VStack {
                                              HeaderCell(post: post)
                                              FooterCell(post: post)
                                          }
                                      }
                                     
                                  }
                              
                            }
                   
                        }.navigationBarTitle(Text("Mushfeed"), displayMode: .inline).onAppear {
                            self.postPopularViewModel.loadPostPopular()
                        }.navigationBarItems(trailing: Button(action: {}) {
                            NavigationLink(destination: CameraView().navigationViewStyle(StackNavigationViewStyle())) {
                                Image(systemName: "plus").imageScale(Image.Scale.large).foregroundColor(.primary)
                            }
                   }
                )}
               
        
        }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
