//
//  IndexMushroomItem.swift
//  instagram
//
//  Created by Alek Michelson on 1/29/21.
//  Copyright © 2021 Alek Michelson. All rights reserved.
//

import SwiftUI

struct IndexMushroomItem: View {
    
    var indexMushroom:IndexMushroom
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Image(indexMushroom.imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 170)
                .cornerRadius(10)
                .shadow(radius: 10)
            VStack(alignment: .leading, spacing: 5.0) {
                Text(indexMushroom.name)
                    .foregroundColor(.primary)
                    .font(.headline)
                Text(indexMushroom.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .frame(height: 40)
            }
            
        }
    }
}

struct IndexMushroomItem_Previews: PreviewProvider {
    static var previews: some View {
        IndexMushroomItem(indexMushroom: indexMushroomData[0])
    }
}
