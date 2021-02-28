//
//  SignInHeaderView.swift
//  instagram
//
//  Created by Alek Michelson on 7/22/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        Group {
            Image(IMAGE_LOGO).resizable().aspectRatio(contentMode: .fill).frame(width: 80, height: 80)
            Text(TEXT_SIGNIN_HEADLINE).font(Font.title).padding(.bottom)
            Text(TEXT_SIGNIN_HEADLINE)
                .font(Font.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(TextAlignment.center)
        }
    }
}
