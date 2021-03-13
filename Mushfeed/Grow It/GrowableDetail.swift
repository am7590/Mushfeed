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
                
                
                // Links
                if(drink.link1.isEmpty){
                        Text("")
                } else {
                    Link(drink.link1,
                         destination: URL(string: drink.link1)!)
                }
                
                if(drink.link2.isEmpty){
                        Text("")
                } else {
                    Link(drink.link2,
                         destination: URL(string: drink.link2)!)
                }
                
                if(drink.link3.isEmpty){
                        Text("")
                } else {
                    Link(drink.link3,
                         destination: URL(string: drink.link3)!)
                }
                
                if(drink.link4.isEmpty){
                        Text("")
                } else {
                    Link(drink.link4,
                         destination: URL(string: drink.link4)!)
                }

            
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
