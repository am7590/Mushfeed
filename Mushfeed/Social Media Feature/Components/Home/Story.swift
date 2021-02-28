//
//  Story.swift
//  instagram
//
//  Created by Alek Michelson on 8/4/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import SwiftUI

struct Story: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 22) {
                ForEach(1..<1) { _ in
                    VStack {
                        Image("photo1").resizable().clipShape(Circle()).aspectRatio(contentMode: ContentMode.fill).frame(width: 50, height: 50).overlay(Circle().inset(by: -2.5).stroke(AngularGradient(gradient: Gradient(colors: Color.instagram), center: UnitPoint(x: 0.5, y:0.5)), lineWidth: 5)).overlay(Circle().inset(by: -1.25).stroke(Color.white, lineWidth: 2)).shadow(radius: 3)
                        Text("Story").font(.caption)
                    }
                }
                }//.padding(.top, 10).padding(.leading, 15)
            //Image("add").position(x: 50, y: -40)
        }//.frame( height: 90)
    }
}


