//
//  ExpandingList.swift
//  instagram
//
//  Created by Alek Michelson on 2/10/21.
//  Copyright © 2021 Alek Michelson. All rights reserved.
//

import Foundation

struct ExpandingList: Identifiable, Hashable {
    let id: Int
    let name: String
    let text: String
    
// Placeholder steps
//    static func samples() -> [ExpandingList] {
//        [ExpandingList(
//            mush: growableMushroomData[1],
//            id: 0,
//            name: "What you need",
//            text: "Step 1 text" //growableMushroomData[0].instructions[id]
//        ), ExpandingList(
//            mush: growableMushroomData[1],
//            id: 1,
//            name:  "Step 1",
//            text: "Step 1 text" //growableMushroomData[0].instructions[id]
//        ), ExpandingList(
//            mush: growableMushroomData[1],
//            id: 2,
//            name: "Step 2",
//            text: "Step 2 text" //growableMushroomData[0].instructions[id]
//        )]
//    }
    
    
// Custom steps
    static func growableMushroomSteps(mush: GrowableMushroom) -> [ExpandingList] {
        [ExpandingList(
            id: 0,
            name: "What you need",
            text: mush.instructions[0]
        ), ExpandingList(
            id: 1,
            name:  "Step 1",
            text: mush.instructions[1]
        ), ExpandingList(
            id: 2,
            name: "Step 2",
            text: mush.instructions[2]
        ), ExpandingList(
            id: 3,
            name: "Step 3",
            text: mush.instructions[3]
        ), ExpandingList(
            id: 4,
            name: "Step 4",
            text: mush.instructions[4]
        )]
    }
}
