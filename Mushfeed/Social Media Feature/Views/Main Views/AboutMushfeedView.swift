//
//  AboutMushfeedView.swift
//  Mushfeed
//
//  Created by Alek Michelson on 9/27/21.
//

import SwiftUI
import URLImage

struct AboutMushfeedView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.openURL) var openURL
    
    var body: some View {
        ScrollView {
            VStack {
                
                
                Text("About Mushfeed")
                    .font(.largeTitle)
                    .bold()
                
//                Text("Before you use the app, please read the following guidelines:")
//                    .font(.subheadline)
//                    .bold()
                
                
                
                VStack(alignment: .leading) {



                    HStack(){
                        Image(colorScheme == .dark ? "pfp3b" : "pfp3w").resizable().aspectRatio(contentMode: .fill).frame(width: 70, height: 70).clipShape(Circle())
                        Text("This app was made by Alek Michelson, a second year CS major at RIT as a resume project. If you would like to get in contact with me, email am7590@rit.edu.")
                            .font(.headline)
                    }
                    

                    HStack(){
                        Image(colorScheme == .dark ? "pfp2b" : "pfp2w").resizable().aspectRatio(contentMode: .fill).frame(width: 70, height: 70).clipShape(Circle())
                        Button(action: {openURL(URL(string: "https://www.instagram.com/epheremic/")!)}) {
                            HStack {
                                Text("Credit for all Mushfeed icon art goes to Stefen Lempert.")
                                    .font(.headline)
                            }
                    }

                    

                    }

                }
                
                Spacer()
                
            }
        }
    }
}

