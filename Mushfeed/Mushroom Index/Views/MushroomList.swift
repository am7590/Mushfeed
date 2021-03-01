//
//  MushroomList.swift
//  Mushfeed
//
//  Created by Alek Michelson on 2/28/21.
//

import SwiftUI

struct MushroomList: View {
    var body: some View {
        List(indexMushroomData, id: \.id) { mushroom in
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

