//
//  TopImage.swift
//  instagram
//
//  Created by Alek Michelson on 1/4/21.
//  Copyright © 2021 Alek Michelson. All rights reserved.
//

import SwiftUI

struct TopImage: View {
    var image: Image

    var body: some View {
        GeometryReader{reader in
                            
            if reader.frame(in: .global).minY > -380 {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .offset(y: -reader.frame(in: .global).minY)
                    .frame(width: UIScreen.main.bounds.width, height:  reader.frame(in: .global).minY > 0 ? reader.frame(in: .global).minY + 380 : 380)
                
            }
        }.frame(height: 380)
    }
}



struct TopImage_Previews: PreviewProvider {
    static var previews: some View {
        TopImage(image: Image("mush4"))
    }
}

