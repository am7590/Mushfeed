//
//  GrowableDetail.swift
//  instagram
//
//  Created by Alek Michelson on 1/29/21.
//  Copyright © 2021 Alek Michelson. All rights reserved.
//

import SwiftUI
import URLImage

struct GrowableDetail: View {
    
    var drink : GrowableMushroom
    @Environment(\.openURL) var openURL
    
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
                    .fixedSize(horizontal: false, vertical: true)
                    
                if(drink.category.rawValue != "grow kits"){
                    
                    
                    
                    VStack(alignment: .leading) {
                        Text("How to Grow")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        
                        ExpandingListView(lists: ExpandingList.growableMushroomSteps(mush: drink)).offset(x: -20)//.frame(height: 500)
                    }.frame(height: 500)
                
                
                
                
                    
                    Text("References")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    
                    
                    List {
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
                    }.frame(height: 200)
                    
                    
                } else {
                    VStack(alignment:.center){
                        
                        
                        Button(action: {openURL(URL(string: drink.storeLink)!)}) {
                            HStack {
                                Spacer()
                                Text("Check it out").font(.largeTitle).fontWeight(.bold).foregroundColor(Color(UIColor.systemBackground))
                                Spacer()
                            }.frame(height: 30).background(Color.primary).padding(.top, 5)
                            
                        }.cornerRadius(5)
                        
                    Text("\nMushfeed does not use affiliate links, and we only reccomend reputable products.").font(.caption)
                    }
                        
                }
                
                
                
                    
                
                

            
            }
            
    //        .onAppear {
    //            UITableView.appearance().separatorStyle = .none
    //        }
            //.listStyle(SidebarListStyle())
    }.edgesIgnoringSafeArea(.top)
        .navigationTitle(drink.category.rawValue == "grow kits" ? "Grow Kits" : "Instructions")
    }
}


struct DrinkDetail_Previews: PreviewProvider {
    static var previews: some View {
        GrowableDetail(drink: growableMushroomData[0])
    }
}
