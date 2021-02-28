//
//  EditProfileButton.swift
//  instagram
//
//  Created by Alek Michelson on 8/20/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import SwiftUI


struct EditProfileButton: View {
    var body: some View {
        Button(action: {}) {
            HStack {
                Spacer()
                Text("Edit Profile").fontWeight(.bold).foregroundColor(Color.white)
                Spacer()
            }.frame(height: 45).background(Color.black)
            
        }.cornerRadius(5).padding(.leading, 20).padding(.trailing, 20)
    }
}

