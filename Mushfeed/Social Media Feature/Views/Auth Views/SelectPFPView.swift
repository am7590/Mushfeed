//
//  SelectPFPView.swift
//  Mushfeed
//
//  Created by Alek Michelson on 3/27/21.
//

import SwiftUI

struct SelectPFPView: View {
    @Binding var imageName: [String]
    @State private var selected: String?
    @State var imageData: Data = Data()
    @ObservedObject var signupViewModel = SignupViewModel()
    @Environment(\.colorScheme) var colorScheme
    var whiteImages = ["pfp1w", "pfp9w", "pfp3w","pfp4w", "pfp5w", "pfp6w", "pfp7w", "pfp8w", "pfp2w"]
    var blackImages = ["pfp1b", "pfp9b", "pfp3b","pfp4b", "pfp5b", "pfp6b", "pfp7b", "pfp8b", "pfp2b"]
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach(colorScheme == .dark ? blackImages : whiteImages, id: \.self) { image in
                    Image(image).resizable().padding(.leading, 5).aspectRatio(contentMode: .fill).frame(width: 120, height: 120).overlay(
                        Circle().stroke(selected == image ? Color.primary : Color.clear, lineWidth: 4).frame(width: 110, height:110)
                    ).onTapGesture {
                        self.selected = image
                        var pfp = image
                        var pfp2 = image
                        pfp.removeLast()
                        pfp2.removeLast()
                        pfp = pfp.appending("b")
                        imageName[0] = pfp
                        pfp2 = pfp2.appending("w")
                        imageName[1] = pfp2
                        
                    }
                }
            }.frame(height: 100).padding()
        }
        
    }
    
}

