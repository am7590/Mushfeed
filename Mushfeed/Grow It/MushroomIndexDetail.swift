//
//  MushroomDetail.swift
//  Landmarks
//
//  Created by Alek Michelson on 12/31/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

func getLocationIcon(input: String) -> String {
    
    switch input {
    case "Forest Floor":
        return "forest-floor-iconW"
    case "Dead Wood":
        return "dead-wood-iconW"
    case "Trees":
        return "tree-iconW"
    case "Grass":
        return "grass-iconW"
    case "Cultivated":
        return "cultivated-iconW"
    case "Corn":
        return "corn-smut2"
    default:
        return ""
    }
    
}

func getLocationString(input: String) -> String {
    
    switch input {
    case "Forest Floor":
        return "Forest Floor"
    case "Dead Wood":
        return "Dead Wood"
    case "Trees":
        return "Trees"
    case "Grass":
        return "Grass"
    case "Cultivated":
        return "Cultivated"
    default:
        return ""
    }
    
}

func getEdibilityStatus(input: String) -> String {
    
    switch input {
    case "Edible":
        return "edible 2"
    case "Poisonous":
        return "poisonousW"
    case "Not Edible":
        return "notEdibleW"
    case "Use Caution":
        return "useCautionW"
    default:
        return ""
    }
    
}


struct MushroomIndexDetail: View {
    var mushroom: IndexMushroom
    @Environment(\.colorScheme) var colorScheme
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
                    Image(getEdibilityStatus(input: mushroom.edible))
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
                    Image(mushroom.gourmet == "Choice" ? "choiceW" : "notChoiceW").resizable().aspectRatio(contentMode: .fill).clipShape(Circle()).frame(width: 35, height: 35).overlay(Circle().stroke(Color.black, lineWidth: 2))
                    
                    Text(mushroom.gourmet)
                        .font(.title)
                }
                
                HStack() {
                    Image("familyW")
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
                        .fixedSize(horizontal: false, vertical: true)
                                   
                    
                    
                }
                
                Text("Where it grows")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            
                
                VStack(alignment: .leading,spacing: 15) {
                    
                    Spacer()
                    
                    HStack(spacing: 15){
                        Image(systemName: "chevron.left").opacity(0.0).imageScale(.small)
                        
                        VStack {
                            Image(getLocationIcon(input: mushroom.locations[0]))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .frame(width: 90, height: 90)
                                .overlay(Circle().stroke(mushroom.locations[0] == "" ? Color(UIColor.systemBackground) : Color.black, lineWidth: 2))
                            
                            Text(mushroom.locations[0].isEmpty ? "" : mushroom.locations[0])
                                .font(.caption)
                        }
                        
                        VStack {
                            Image(getLocationIcon(input: mushroom.locations[1]))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .frame(width: 90, height: 90)
                                .overlay(Circle().stroke(mushroom.locations[1] == "" ? Color(UIColor.systemBackground) : Color.black, lineWidth: 2))
                            Text(mushroom.locations[1].isEmpty ? "" : mushroom.locations[1])
                                .font(.caption)
                        }
                        
                        VStack {
                            Image(getLocationIcon(input: mushroom.locations[2]))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .frame(width: 90, height: 90)
                                .overlay(Circle().stroke(mushroom.locations[2] == "" ? Color(UIColor.systemBackground) : Color.black, lineWidth: 2))
                            Text(mushroom.locations[2].isEmpty ? "" : mushroom.locations[2])
                                .font(.caption)
                        }
                        
                        Image(systemName: "chevron.right").opacity(0.0).imageScale(.small)
            
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
                        .fixedSize(horizontal: false, vertical: true)
               
                    }
                    
                    HStack() {
                        VStack(alignment: .leading,spacing: 15) {
                            Text("Natural Occurance")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
          
                            Image(mushroom.map)
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
          
                            Image(mushroom.chart)
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
                        .fixedSize(horizontal: false, vertical: true)

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
                            
                            if(mushroom.image1.isEmpty){
                                    Text("")
                            } else {
                                Link(mushroom.image1,
                                     destination: URL(string: mushroom.image1)!)
                            }
                            
                            if(mushroom.image2.isEmpty){
                                    Text("")
                            } else {
                                Link(mushroom.image2,
                                     destination: URL(string: mushroom.image2)!)
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
