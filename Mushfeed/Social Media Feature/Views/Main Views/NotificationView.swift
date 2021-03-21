//
//  NotificationView.swift
//  instagram
//
//  Created by Alek Michelson on 8/7/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        NavigationView {
            List {
                  ForEach(0..<10) { _ in
                        HStack {
                          Image("photo1").resizable().clipShape(Circle())
                              .frame(width: 50, height: 50)
                          VStack(alignment: .leading, spacing: 5) {
                              Text("David").font(.headline).bold()
                              Text("Shared a new photo").font(.subheadline)
                          }
                          Spacer()
                          Text("15:00").bold()
                      }.padding(10)
                  }
           
            }.navigationBarTitle(Text("Activity"), displayMode: .inline)
        }.foregroundColor(.primary)
      
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
