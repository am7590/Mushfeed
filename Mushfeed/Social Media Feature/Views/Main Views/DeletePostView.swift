//
//  DeletePostView.swift
//  Mushfeed
//
//  Created by Alek Michelson on 3/28/21.
//

import SwiftUI

struct DeletePostView: View {
    @ObservedObject var profileViewModel = ProfileViewModel()
    var body: some View {
        Text("Delete Post")
    }
}

struct DeletePostView_Previews: PreviewProvider {
    static var previews: some View {
        DeletePostView()
    }
}
