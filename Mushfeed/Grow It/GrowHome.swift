//
//  GrowHome.swift
//  instagram
//
//  Created by Alek Michelson on 1/29/21.
//  Copyright © 2021 Alek Michelson. All rights reserved.
//

import SwiftUI

struct GrowHome: View {
    
    var categories:[String:[GrowableMushroom]] {
        .init(
            grouping: growableMushroomData,
            by: {$0.category.rawValue}
        )
    }
    
    
    var body: some View {
        NavigationView{
            List(categories.keys.sorted(), id: \String.self) { key in
                GrowableMushroomRow(categoryName: "\(key)".uppercased(), growableMushrooms: self.categories[key]!)
                    .frame(height: 320)
                    .padding(.top)
                    .padding(.bottom)
            }
            .navigationTitle(Text("Grow Mushrooms"))
        }
    }
}

struct GrowHome_Previews: PreviewProvider {
    static var previews: some View {
        GrowHome()
    }
}
