//
//  EmailTextField.swift
//  instagram
//
//  Created by Alek Michelson on 7/22/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import SwiftUI

struct EmailTextField: View {
    
    @Binding var email: String
    
    var body: some View {
        HStack {
            Image(systemName: "envelope.fill").foregroundColor(Color.gray)
            TextField(TEXT_EMAIL, text: $email)
        }.modifier(TextFieldModifier())
    }
}
