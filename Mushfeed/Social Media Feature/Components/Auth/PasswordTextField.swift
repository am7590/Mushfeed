//
//  PasswordTextField.swift
//  instagram
//
//  Created by Alek Michelson on 7/22/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import SwiftUI

struct PasswordTextField: View {
    
    @Binding var password: String
    var body: some View {
        HStack {
            Image(systemName: "lock.fill").foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.3))
            SecureField(TEXT_PASSWORD, text: $password)
        }.modifier(TextFieldModifier())
    
    }
}
