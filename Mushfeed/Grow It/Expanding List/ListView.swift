//
//  ListView.swift
//  instagram
//
//  Created by Alek Michelson on 2/10/21.
//  Copyright © 2021 Alek Michelson. All rights reserved.
//

import SwiftUI

struct ListView: View {
    let expanded: ExpandingList
    let isExpanded: Bool
    //let mush: GrowableMushroom
    
    var body: some View {
        HStack {
            content
            Spacer()
        }
        .contentShape(Rectangle())
    }
    
    private var content: some View {
        VStack(alignment: .leading) {
            Text(expanded.name).font(.title)
            
            if isExpanded {
                
                VStack(alignment: .leading) {
                    Text(expanded.text)
                    //Text(growableMushroomData[id].instructions[id])

                }
            }
        }
    }
}
