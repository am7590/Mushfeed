//
//  MushroomList.swift
//  instagram
//
//  Created by Alek Michelson on 1/4/21.
//  Copyright © 2021 Alek Michelson. All rights reserved.
//

import SwiftUI

struct MushroomList: View {
    var body: some View {
        List(mushrooms, id: \.id) { mushroom in
            NavigationLink(destination: MushroomDetail(mushroom: mushroom)) {
                MushroomRow(mushroom: mushroom)
            }
        }
        
    }
}

struct MushroomList_Previews: PreviewProvider {
    static var previews: some View {
        MushroomList()
    }
}
