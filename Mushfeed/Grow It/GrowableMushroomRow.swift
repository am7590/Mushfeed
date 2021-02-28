//
//  EnokiList.swift
//  instagram
//
//  Created by Alek Michelson on 1/14/21.
//  Copyright © 2021 Alek Michelson. All rights reserved.
//

import SwiftUI

struct GrowableMushroomRow: View {
    
    var categoryName : String
    var growableMushrooms : [GrowableMushroom]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(self.categoryName)
                .font(.title)
            ScrollView(.horizontal, showsIndicators: false) {
                    
                HStack(alignment: .top) {
                    ForEach (growableMushrooms, id: \.name) { drink in
                        NavigationLink(destination: GrowableDetail(drink: drink)){
                            GrowableMushroomItem(growableMushroom: drink)
                                .frame(width: 300)
                                .padding(.trailing, 30)
                        }
                            
                        
                        
                    }
                }
                
            }
        }
        
        
    }
}

struct GrowableMushroomRow_Previews: PreviewProvider {
    static var previews: some View {
        GrowableMushroomRow(categoryName: "Mushrooms", growableMushrooms: growableMushroomData)
    }
}
