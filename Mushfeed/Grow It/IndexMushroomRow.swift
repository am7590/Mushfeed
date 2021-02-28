//
//  ReishiList.swift
//  instagram
//
//  Created by Alek Michelson on 1/14/21.
//  Copyright © 2021 Alek Michelson. All rights reserved.
//

import SwiftUI

struct IndexMushroomRow: View {
    
    var categoryName : String
    var indexMushrooms : [IndexMushroom]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(self.categoryName)
                .font(.title)
            ScrollView(.horizontal, showsIndicators: false) {
                    
                HStack(alignment: .top) {
                    ForEach (indexMushrooms, id: \.name) { drink in
                        NavigationLink(destination: MushroomIndexDetail(mushroom: drink)){
                        IndexMushroomItem(indexMushroom: drink)
                            .frame(width: 300)
                            .padding(.trailing, 30)
                        }
                        
                        
                    }
                }
                
            }
        }
        
        
    }
}

struct IndexMushroomRow_Previews: PreviewProvider {
    static var previews: some View {
        IndexMushroomRow(categoryName: "Mushrooms", indexMushrooms: indexMushroomData)
    }
}
