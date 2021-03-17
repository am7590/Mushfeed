//
//  UsernameTextField.swift
//  instagram
//
//  Created by Alek Michelson on 7/26/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import SwiftUI

struct UsernameTextField: View {
    @Binding var username: String
        
        var body: some View {
            HStack {
                Image(systemName: "person.fill").foregroundColor(Color.gray)
                TextField(TEXT_USERNAME, text: $username)
            }.modifier(TextFieldModifier())
        }
    }

