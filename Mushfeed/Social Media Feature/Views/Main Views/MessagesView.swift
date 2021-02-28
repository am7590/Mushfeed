//
//  MessagesView.swift
//  instagram
//
//  Created by Alek Michelson on 8/9/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import SwiftUI


struct MessagesView: View {
    var body: some View {
            NavigationView {
               List {
                     ForEach(0..<10) { _ in
                           HStack {
                             Image("photo1").resizable().clipShape(Circle())
                                 .frame(width: 50, height: 50)
                             VStack(alignment: .leading, spacing: 5) {
                                 Text("David").font(.headline).bold()
                                Text("Shared a new photoShared a new photoShared a new photoShared a new photo").font(.subheadline).lineLimit(2)
                             }
                             Spacer()
                            VStack(spacing: 5) {
                                Text("15:00").bold()
                            Text("2").padding(8).background(Color.blue).foregroundColor(Color.white).clipShape(Circle())
                            }
                             
                         }.padding(10)
                     }
              
               }.navigationBarTitle(Text("Messages"), displayMode: .inline)
           }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
