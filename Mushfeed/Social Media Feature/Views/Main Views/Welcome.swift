//
//  Welcome.swift
//  Mushfeed
//
//  Created by Alek Michelson on 9/27/21.
//

import SwiftUI

struct Welcome: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack {
                
//                HStack {
//                    Image(colorScheme == .dark ? "pfp4b" : "pfp4w").resizable().aspectRatio(contentMode: .fill).frame(width: 70, height: 70).clipShape(Circle())
//                    Image(colorScheme == .dark ? "pfp3b" : "pfp3w").resizable().aspectRatio(contentMode: .fill).frame(width: 70, height: 70).clipShape(Circle())
//                    Image(colorScheme == .dark ? "pfp5b" : "pfp5w").resizable().aspectRatio(contentMode: .fill).frame(width: 70, height: 70).clipShape(Circle())
//                }
                
                Text("Welcome to Mushfeed!")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 20)
                
                Text("Before you use the app, please read the following guidelines:")
                    .font(.subheadline)
                    .bold()
                    .padding(.top, 10)
                
                
                
                VStack(alignment: .leading) {



                    HStack(){
                        Image(colorScheme == .dark ? "pfp3b" : "pfp3w").resizable().aspectRatio(contentMode: .fill).frame(width: 70, height: 70).clipShape(Circle())
                        Text("Only post pictures of gourmet mushrooms.")
                            .font(.headline)
                    }.padding(.top, 10)

                    
                    HStack(){
                        Image(colorScheme == .dark ? "pfp4b" : "pfp4w").resizable().aspectRatio(contentMode: .fill).frame(width: 70, height: 70).clipShape(Circle())
                        Text("Mushfeed is an entertainment app that is not meant to positively identify mushrooms you find in the wild or otherwise.")
                            .font(.headline)
                    }.padding(.top, 10)

                    
                    HStack(){
                        Image(colorScheme == .dark ? "pfp5b" : "pfp5w").resizable().aspectRatio(contentMode: .fill).frame(width: 70, height: 70).clipShape(Circle())
                        Text("Do not use this app as a basis to consume any mushroom.")
                            .font(.headline)
                    }.padding(.top, 10)

                }.padding(.top, 15)
                
                Spacer()
                
            }
        }
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}
