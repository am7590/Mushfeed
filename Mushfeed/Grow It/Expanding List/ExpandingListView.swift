//
//  ExpandingListView.swift
//  instagram
//
//  Created by Alek Michelson on 2/10/21.
//  Copyright © 2021 Alek Michelson. All rights reserved.
//

import SwiftUI

struct ExpandingListView: View {
    let lists: [ExpandingList]
    @State private var selection: Set<ExpandingList> = []
    
    var body: some View {
        scrollForEach
//            list
    }
    
    var list: some View {
        List(lists) { xlist in
            ListView(expanded: xlist, isExpanded: self.selection.contains(xlist))
                .onTapGesture { self.selectDeselect(xlist) }
                .animation(.linear(duration: 0.3))
        }
    }
    
    var scrollForEach: some View {
        ScrollView {
            ForEach(lists) { xlist in
                ListView(expanded: xlist, isExpanded: self.selection.contains(xlist))
                    .modifier(ListRowModifier())
                    .onTapGesture { self.selectDeselect(xlist) }
                    .animation(.linear(duration: 0.3))
            }
        }
    }
    
    private func selectDeselect(_ place: ExpandingList) {
        if selection.contains(place) {
            selection.remove(place)
        } else {
            selection.insert(place)
        }
    }
}

struct ListRowModifier: ViewModifier {
    func body(content: Content) -> some View {
        Group {
            content
            Divider()
        }.offset(x: 20)
    }
}

struct PlacesList_Previews: PreviewProvider {
    static var previews: some View {
        ExpandingListView(lists: ExpandingList.growableMushroomSteps(mush: growableMushroomData[1]))
    }
}
