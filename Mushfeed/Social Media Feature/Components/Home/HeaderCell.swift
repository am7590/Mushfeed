//
//  HeaderCell.swift
//  instagram
//
//  Created by Alek Michelson on 8/4/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import SwiftUI
import URLImage

struct HeaderCell: View {
    
    @ObservedObject var footerCellViewModel = FooterCellViewModel()

    var post: Post
    @EnvironmentObject var session: SessionStore
    var body: some View {
        
        
        VStack {
            //ZStack {
//                RoundedRectangle(cornerRadius: 25, style: .continuous).stroke(Color.black, lineWidth: 1)
//                .frame(width: 340, height: 45.0).padding(.leading, 15).padding(.trailing, 15)
            HStack {
                
                Image(post.avatar).resizable().aspectRatio(contentMode: .fill).clipShape(Circle())
                
                .frame(width: 35, height: 35)
                .padding(.leading, 20)

                
                
                //                    VStack(alignment: .leading) {
//
//                        Text("location").font(.caption)
//                    }
                    Text(post.username).font(.subheadline).bold().padding(.leading, 5)
                    //Text(self.footerCellViewModel.post.caption).font(.subheadline)
                    Spacer()
            }
            //}
                
            URLImage(url: URL(string: post.mediaUrl)!,
                                          content: { image in
                                              image
                                                  .resizable()
                                                  .aspectRatio(contentMode: .fill)
                                          }).frame(width: UIScreen.main.bounds.size.width - 30, height: 300).clipped().cornerRadius(10).shadow(radius: 10)
        }
    
    }
}


struct HeaderCell_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
