//
//  MushroomRow.swift
//  instagram
//
//  Created by Alek Michelson on 1/4/21.
//  Copyright © 2021 Alek Michelson. All rights reserved.
//

import SwiftUI

struct MushroomRow: View {
    var mushroom: Mushroom

    var body: some View {
        HStack {
            mushroom.image
                .resizable()
                .frame(width: 50, height: 50).cornerRadius(15)
            Text(mushroom.name)
            
            Spacer()
        }
    }
}

struct MushroomRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MushroomRow(mushroom: mushrooms[0])
            MushroomRow(mushroom: mushrooms[1])
                
        }.previewLayout(.fixed(width: 300, height: 70))
        
    }
}
