//
//  GrowList.swift
//  instagram
//
//  Created by Alek Michelson on 1/4/21.
//  Copyright © 2021 Alek Michelson. All rights reserved.
//

import SwiftUI

import SwiftUI

struct GrowableMushroom: Hashable, Codable, Identifiable {
    var id : Int
    var name : String
    var imageName : String
    var category : Category
    //var featured : Bool
    var description : String
    var instructions : [String]
    var link1 : String
    var link2 : String
    var link3 : String
    var link4 : String
    
    enum Category : String, CaseIterable, Codable, Hashable {
        case beginner = "beginner"
        case difficult = "difficult"
        case bags = "grow bags"
    }
    
    
}
