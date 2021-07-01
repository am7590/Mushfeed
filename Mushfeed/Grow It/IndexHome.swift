//
//  IndexHome.swift
//  instagram
//
//  Created by Alek Michelson on 1/29/21.
//  Copyright © 2021 Alek Michelson. All rights reserved.
//

import SwiftUI

struct IndexHome: View {
    
    var categories:[String:[IndexMushroom]] {
        .init(
            grouping: indexMushroomData,
            by: {$0.category.rawValue}
        )
    }
    
    var body: some View {
        
        NavigationView{
            List(categories.keys.sorted(), id: \String.self) { key in
                IndexMushroomRow(categoryName: "\(key)".uppercased(), indexMushrooms: self.categories[key]!)
                    .frame(height: 320)
                    .padding(.top)
                    .padding(.bottom)
            }
            .navigationTitle(Text("Mushroom Index"))

        }
        
    }
}

struct IndexHome_Previews: PreviewProvider {
    static var previews: some View {
        IndexHome()
    }
}
