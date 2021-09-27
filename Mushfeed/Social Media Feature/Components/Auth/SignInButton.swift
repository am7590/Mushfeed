//
//  SignInButton.swift
//  instagram
//
//  Created by Alek Michelson on 7/22/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import Foundation
import SwiftUI

struct SignInButton: View {
    @Environment(\.colorScheme) var colorScheme
    var action: () -> Void
    var label: String
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(label).fontWeight(.bold).foregroundColor(colorScheme == .dark ? .black : .white)
                Spacer()
            }
            
        }.modifier(SigninButtonModifier())
    }
}
