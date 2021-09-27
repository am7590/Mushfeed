//
//  SignupButton.swift
//  instagram
//
//  Created by Alek Michelson on 7/26/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import SwiftUI

struct SignupButton: View {
    @Environment(\.colorScheme) var colorScheme
    var action: () -> Void
    var label: String
    var body: some View {
        Button(action: action) {
            HStack {
                Text(label).fontWeight(.bold).foregroundColor(colorScheme == .dark ? Color.black : Color.white)
            }.frame(maxWidth: .infinity)
            
        }.modifier(SigninButtonModifier())
    }
}
