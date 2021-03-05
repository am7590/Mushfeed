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
                    .foregroundColor(.black)
                
                
                Text(mushroom.scientificName)
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(.top,0)
                
                Divider().padding(.leading, 0).padding(.trailing, 0)
                
                
                HStack() {
                
                    Image("icon1").resizable().aspectRatio(contentMode: .fill).clipShape(Circle()).frame(width: 35, height: 35).overlay(Circle().stroke(Color.black, lineWidth: 2))
                    Text(mushroom.edible)
                    .font(.title)
                
                }
                
                HStack() {
                    Image("icon2").resizable().aspectRatio(contentMode: .fill).clipShape(Circle()).frame(width: 35, height: 35).overlay(Circle().stroke(Color.black, lineWidth: 2))
                    
                    Text(mushroom.gourmet)
                        .font(.title)
                }
                
                HStack() {
                    Image("icon3").resizable().aspectRatio(contentMode: .fill).clipShape(Circle()).frame(width: 35, height: 35).overlay(Circle().stroke(Color.black, lineWidth: 2))
                    
                    Text(mushroom.family)
                        .font(.title)

                }
                
                Divider()
                
                Text("Description")
                .font(.largeTitle)
                .fontWeight(.bold)
                
                Text(mushroom.description)
                    .padding(.top, 0)
                    .foregroundColor(.black)
                                
                VStack(alignment: .leading,spacing: 15) {
                    
                    Spacer()
                    HStack(spacing: 15){
                        Image(systemName: "chevron.left")
                        Image("icon1").resizable().aspectRatio(contentMode: .fill).clipShape(Circle()).frame(width: 90, height: 90).overlay(Circle().stroke(Color.black, lineWidth: 2))
                        Image("icon2").resizable().aspectRatio(contentMode: .fill).clipShape(Circle()).frame(width: 90, height: 90).overlay(Circle().stroke(Color.black, lineWidth: 2))
                        Image("icon3").resizable().aspectRatio(contentMode: .fill).clipShape(Circle()).frame(width: 90, height: 90).overlay(Circle().stroke(Color.black, lineWidth: 2))
                        Image(systemName: "chevron.right")
                    }
                    Divider()
                    
                    VStack(alignment: .leading,spacing: 15) {
                        Text("Appearance")
                        .font(.largeTitle)
                            .fontWeight(.bold)
                    
                    
                    Text(mushroom.appearance)
                        .padding(.top, 0)
                        .foregroundColor(.black)
               
                    }
                    
                    HStack() {
                        VStack(alignment: .leading,spacing: 15) {
                            Text("Natural Occurance")
                            .font(.largeTitle)
                            .fontWeight(.bold)
          
                            Image("occ").resizable().aspectRatio(contentMode: .fill)
                        }
                        
                        
                    }
                    
                    HStack() {
                        VStack(alignment: .leading,spacing: 15) {
                            Text("Monthly Occurances")
                            .font(.largeTitle)
                            .fontWeight(.bold)
          
                            Image("occur").resizable().aspectRatio(contentMode: .fill)
                            Text("Occurance data is from gbif.org")
                            .font(.subheadline)
                            
                        }
                        
                        
                    }
                    
                    Divider()
                    
                    HStack() {
                        Text("Fun Fact")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    }
                    
                    Text(mushroom.funFact)

                    VStack(alignment: .leading,spacing: 15){
                    
                        Divider()
                        
                        
                            Text("Sources & References")
                            .font(.largeTitle)
                            .fontWeight(.bold)

                            
                        
                        
                        
                        List{
                            Text(mushroom.sources)
                            Text(mushroom.resources)
                            Text(mushroom.wiki)
                            
                            
                        }.frame(height: 200).padding(.leading, -15)
                        
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
            .background(Color.white)
            .cornerRadius(20)
            .offset(y: -35)
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct MushroomIndexDetail_Previews: PreviewProvider {
    static var previews: some View {
        MushroomDetail(mushroom: indexMushroomData[0])
    }
}
