//
//  Comment.swift
//  instagram
//
//  Created by Alek Michelson on 8/23/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import Foundation

struct Comment: Encodable, Decodable, Identifiable {
    var id = UUID()
    var comment: String
    var avatarUrl: String
    var ownerId: String
    var postId: String
    var username: String
    var date: Double
    
}
