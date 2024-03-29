//
//  GridPosts.swift
//  instagram
//
//  Created by Alek Michelson on 8/20/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import SwiftUI
import URLImage

struct GridPosts: View {
    
    var user: User?
    @State var splitted: [[Post]] = []
    var body: some View {
        VStack(alignment: .leading, spacing: 1) {
            // rows
            
                ForEach(0..<self.splitted.count) { index in
                    HStack(spacing: 1) {
                        
                        ForEach(self.splitted[index], id: \.postId) { post in
                            
                            URLImage(url: URL(string: post.mediaUrl)!,
                                     content: { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            
                                        
                                     }).frame(width: UIScreen.main.bounds.width / 3.1, height: UIScreen.main.bounds.width / 3.1).clipped().cornerRadius(10)
                            
                            
                            
                            
                        }
                    }
                }
            }
        }
    }

