//
//  Mushroom.swift
//  instagram
//
//  Created by Alek Michelson on 1/4/21.
//  Copyright © 2021 Alek Michelson. All rights reserved.
//

import Foundation
import SwiftUI

struct Mushroom: Hashable, Codable {
    var id: Int
    var name: String
    var scientificName: String
    var edible: String
    var gourmet: String
    var family: String
    var description: String
    var appearance: String
    var funFact: String
    var lookalikes: String
    var growable: Bool
    var image1: String
    var image2: String
    var wiki: String
    
//    private var imageMap: String
//    var imagem: Image {
//        Image(imageMap)
//    }
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
