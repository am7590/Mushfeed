//
//  GrowableDetail.swift
//  instagram
//
//  Created by Alek Michelson on 1/29/21.
//  Copyright © 2021 Alek Michelson. All rights reserved.
//

import SwiftUI

struct GrowableDetail: View {
    
    var drink : GrowableMushroom
    
    var body: some View {
        List {
            VStack(alignment: .leading,spacing: 15) {
                ZStack(alignment: .bottom) {
                    Image(drink.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(25)
                    
    //                Rectangle()
    //                    .frame(height: 80)
    //                    .opacity(0.25)
    //                    .blur(radius: 10)
    //                HStack {
    //                    VStack(alignment: .leading, spacing: 8){
    //                        Text(drink.name)
    //                            .foregroundColor(.white)
    //                            .font(.largeTitle)
    //                    }
    //                    .padding(.leading)
    //                    .padding(.bottom)
    //                    Spacer()
    //                }
                }
                //.listRowInsets(EdgeInsets())
                
                Text(drink.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                
                
                
                Text(drink.description)
                    .foregroundColor(.primary)
                    .font(.body)
                    .lineSpacing(8)
                
                Text("How to Grow")
                .font(.largeTitle)
                .fontWeight(.bold)
                
                ExpandingListView(lists: ExpandingList.growableMushroomSteps(mush: drink)).offset(x: -20)
                
                Text("References")
                .font(.largeTitle)
                .fontWeight(.bold)
                
                Text("www.wikipedia.com")
                Text("www.mushrooms.com")
                Text("www.youtube.com/tutorial")
            
            
            }
            
    //        .onAppear {
    //            UITableView.appearance().separatorStyle = .none
    //        }
            //.listStyle(SidebarListStyle())
    }.edgesIgnoringSafeArea(.top)
        .navigationTitle("Instructions")
    }
}


struct DrinkDetail_Previews: PreviewProvider {
    static var previews: some View {
        GrowableDetail(drink: growableMushroomData[0])
    }
}
