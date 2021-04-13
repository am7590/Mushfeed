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
    var lookalikes: String
    var growable : Bool
    var image1: String
    var image2: String
    var wiki: String
    var locations : [String]
    var map : String
    var chart : String
    
    enum Category : String, CaseIterable, Codable, Hashable {
        case edible = "edible"
        case poisonous = "poisonous"
        case hallucinogenic = "hallucinogenic"
        case inedible = "inedible"
        case caution = "use caution"
        case choice = "choice"
    }
    

    public var imageName: String
    var image: Image {
        Image(imageName)
    }
}
