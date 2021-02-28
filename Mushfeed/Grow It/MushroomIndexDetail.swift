//
//  MushroomIndexDetail.swift
//  instagram
//
//  Created by Alek Michelson on 2/5/21.
//  Copyright © 2021 Alek Michelson. All rights reserved.
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
                    .foregroundColor(.primary)
                                
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
                        .foregroundColor(.primary)
               
                    }
                    HStack() {
                        Text("Natural Occurance")
                        .font(.largeTitle)
                        .fontWeight(.bold)
      
                    }
                    
                    HStack {
                        Image("map").resizable().aspectRatio(contentMode: .fill)
                        
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
                        
                        HStack() {
                            Text("More Images")
                            .font(.largeTitle)
                            .fontWeight(.bold)

                        
                        }
                        
                        GeometryReader { geometry in
                                        ImageCarouselView(numberOfImages: 3) {
                                            Image("mush4")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: geometry.size.width, height: geometry.size.height)
                                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                            Image("reishi")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: geometry.size.width, height: geometry.size.height)
                                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                            Image("pinkOyster")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: geometry.size.width, height: geometry.size.height)
                                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                        }
                        }.frame(height: 300, alignment: .center).padding(.leading, 0)
                                    
                        
//                        HStack{
//                            Button(action: {
//                                //print("Hello button tapped!")
//                            }) {
//                                Text("Grow This")
//                                    .fontWeight(.semibold)
//                                    .font(.title)
//                                    .foregroundColor(.black)
//                                    .padding()
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 15)
//                                            .stroke(Color.black, lineWidth: 2)
//                                    )
//                            }
//
//                            Spacer()
//
//                            Button(action: {
//                                //print("Hello button tapped!")
//                            }) {
//                                Text("Sources")
//                                    .fontWeight(.semibold)
//                                    .font(.title)
//                                    .foregroundColor(.black)
//                                    .padding()
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 15)
//                                            .stroke(Color.black, lineWidth: 2)
//                                    )
//                            }
//
//
//                        }
//                        HStack(spacing: 15){
//                            Image(systemName: "chevron.left")
//                            Image("icon1").resizable().aspectRatio(contentMode: .fill).clipShape(Circle()).frame(width: 90, height: 90).overlay(Circle().stroke(Color.black, lineWidth: 2))
//                            Image("icon2").resizable().aspectRatio(contentMode: .fill).clipShape(Circle()).frame(width: 90, height: 90).overlay(Circle().stroke(Color.black, lineWidth: 2))
//                            Image("icon3").resizable().aspectRatio(contentMode: .fill).clipShape(Circle()).frame(width: 90, height: 90).overlay(Circle().stroke(Color.black, lineWidth: 2))
//                            Image(systemName: "chevron.right")
//                        }
                        
//                        Divider().padding(.top, 15)
                        
//                        HStack() {
//                            Text("Can I grow this?")
//                            .font(.largeTitle)
//                            .fontWeight(.bold)
//
//                        }
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
        //.background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

struct MushroomIndexDetail_Previews: PreviewProvider {
    static var previews: some View {
        MushroomIndexDetail(mushroom: indexMushroomData[0])
    }
}
