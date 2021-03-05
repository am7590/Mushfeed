//
//  Modifiers.swift
//  instagram
//
//  Created by Alek Michelson on 7/22/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import SwiftUI

struct TextFieldModifier: ViewModifier { 
    func body(content: Content) -> some View {
        content.padding()
            .border(Color.red, width: 1)
            .padding([.top, .leading, .trailing])
    }
}

struct SigninButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.padding().background(Color.red).cornerRadius(5).shadow(radius: 10, x: 0, y: 10).padding()
    }
}


