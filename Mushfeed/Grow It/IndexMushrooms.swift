//
//  PinkOysterList.swift
//  instagram
//
//  Created by Alek Michelson on 1/14/21.
//  Copyright © 2021 Alek Michelson. All rights reserved.
//

import SwiftUI

import SwiftUI

struct IndexMushroom: Hashable, Codable, Identifiable {
    var id : Int
    var name : String
    var scientificName : String
    
    var category : Category
    //var featured : Bool
    var description : String
    var edible : String
    var gourmet : String
    var family : String
    var appearance : String
    var funFact : String
    var growable : Bool
    
    enum Category : String, CaseIterable, Codable, Hashable {
        case edible = "edible"
        case poisonous = "poisonous"
        case hallucinogenic = "hallucinogenic"
    }
    

    public var imageName: String
    var image: Image {
        Image(imageName)
    }
}
