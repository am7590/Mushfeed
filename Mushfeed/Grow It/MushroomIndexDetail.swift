//
//  MushroomDetail.swift
//  Landmarks
//
//  Created by Alek Michelson on 12/31/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct MushroomIndexDetail: View {
    var mushroom: IndexMushroom
    
    var body: some View {
        
        ScrollView {

            TopImage(image: mushroom.image)
            
            VStack(alignment: .leading,spacing: 15){
                
                Text(mushroom.name)
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(.primary)
                
                
                Text(mushroom.scientificName)
                    .font(.title)
                    .foregroundColor(.primary)
                    .padding(.top,0)

                
                Divider()
                    .padding(.leading, 0)
                    .padding(.trailing, 0)
                
                
                HStack() {
                
                    Image("icon1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: 35, height: 35)
                        .overlay(Circle().stroke(Color.black, lineWidth: 2))
                    
                    Text(mushroom.edible)
                        .font(.title)
                        .foregroundColor(.primary)
                    
                
                }
                
                HStack() {
                    Image("icon2").resizable().aspectRatio(contentMode: .fill).clipShape(Circle()).frame(width: 35, height: 35).overlay(Circle().stroke(Color.black, lineWidth: 2))
                    
                    Text(mushroom.gourmet)
                        .font(.title)
                }
                
                HStack() {
                    Image("icon3")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: 35, height: 35)
                        .overlay(Circle().stroke(Color.black, lineWidth: 2))
                    
                    Text(mushroom.family)
                        .font(.title)
                        .foregroundColor(.primary)

                }
                
                Divider()
                
                VStack(alignment: .leading,spacing: 15) {
                    Text("Description")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text(mushroom.description)
                        .padding(.top, 0)
                        .foregroundColor(.primary)
                        .lineLimit(nil)
                                   
                    
                    
                }
                
                Text("Where it grows")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            
                
                VStack(alignment: .leading,spacing: 15) {
                    
                    Spacer()
                    
                    HStack(spacing: 15){
                        Image(systemName: "chevron.left")
                        
                        VStack {
                            Image("icon1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .frame(width: 90, height: 90)
                                .overlay(Circle().stroke(Color.black, lineWidth: 2))
                            
                            Text(mushroom.locations[0].isEmpty ? "" : mushroom.locations[0])
                        }
                        
                        VStack {
                            Image("icon2")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .frame(width: 90, height: 90)
                                .overlay(Circle().stroke(Color.black, lineWidth: 2))
                            Text(mushroom.locations[1].isEmpty ? "" : mushroom.locations[1])
                        }
                        
                        VStack {
                            Image("icon3")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .frame(width: 90, height: 90)
                                .overlay(Circle().stroke(Color.black, lineWidth: 2))
                            Text(mushroom.locations[2].isEmpty ? "" : mushroom.locations[2])
                        }
                        
                        Image(systemName: "chevron.right")
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading,spacing: 15) {
                        Text("Appearance")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                    
                    
                    Text(mushroom.appearance)
                        .padding(.top, 0)
                        .foregroundColor(.primary)
               
                    }
                    
                    HStack() {
                        VStack(alignment: .leading,spacing: 15) {
                            Text("Natural Occurance")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
          
                            Image("occ")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(15)
                        }
                        
                        
                    }
                    
                    HStack() {
                        VStack(alignment: .leading,spacing: 15) {
                            Text("Monthly Occurances")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
          
                            Image("occur")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(15)
                            
                            Text("Occurance data is from gbif.org")
                                .font(.subheadline)
                                .foregroundColor(.primary)
                            
                            
                        }
                        
                        
                    }
                    
                    Divider()
                    
                    HStack() {
                        Text("Fun Fact")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                    
                    }
                    
                    Text(mushroom.funFact)
                        .foregroundColor(.primary)

                    VStack(alignment: .leading,spacing: 15){
                    
                        Divider()
                        
                        
                            Text("Sources & References")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)

                            
                        
                        
                        
                        List{
                            if(mushroom.wiki.isEmpty){
                                    Text("")
                            } else {
                                Link(mushroom.wiki,
                                     destination: URL(string: mushroom.wiki)!)
                            }
                            
                            if(mushroom.resources.isEmpty){
                                    Text("")
                            } else {
                                Link(mushroom.resources,
                                     destination: URL(string: mushroom.resources)!)
                            }
                            
                            if(mushroom.sources.isEmpty){
                                    Text("")
                            } else {
                                Link(mushroom.sources,
                                     destination: URL(string: mushroom.sources)!)
                            }
                            
//                            Link(mushroom.resources,
//                                  destination: URL(string: mushroom.resources)!)
//                            Link(mushroom.sources,
//                                  destination: URL(string: mushroom.sources)!)

                            Text("")
                            Text("")
                            Text("")
                            Text("")
                            Text("")
                            Text("")
                            
                            
                        }.frame(height: 400).padding(.leading, -15)
                        
                        Spacer()
                        
                        
                        // MORE IMAGES code
//                        GeometryReader { geometry in
//                                        ImageCarouselView(numberOfImages: 3) {
//                                            Image("mush4")
//                                                .resizable()
//                                                .scaledToFill()
//                                                .frame(width: geometry.size.width, height: geometry.size.height)
//                                                .clipShape(RoundedRectangle(cornerRadius: 15))
//                                            Image("reishi")
//                                                .resizable()
//                                                .scaledToFill()
//                                                .frame(width: geometry.size.width, height: geometry.size.height)
//                                                .clipShape(RoundedRectangle(cornerRadius: 15))
//                                            Image("pinkOyster")
//                                                .resizable()
//                                                .scaledToFill()
//                                                .frame(width: geometry.size.width, height: geometry.size.height)
//                                                .clipShape(RoundedRectangle(cornerRadius: 15))
//                                        }
//                        }.frame(height: 300, alignment: .center).padding(.leading, 0)
//
//
                    }

                }
                 
                
                
            }
            .padding(.top, 25)
            .padding(.horizontal)
            .background(Color(UIColor.systemBackground))
            .cornerRadius(20)
            .offset(y: -35)
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color.black.edgesIgnoringSafeArea(.all))
        
    }
}

struct MushroomIndexDetail_Previews: PreviewProvider {
    static var previews: some View {
        MushroomDetail(mushroom: indexMushroomData[10])
    }
}
