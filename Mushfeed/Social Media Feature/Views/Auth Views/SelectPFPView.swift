//
//  SelectPFPView.swift
//  Mushfeed
//
//  Created by Alek Michelson on 3/27/21.
//

import SwiftUI

struct SelectPFPView: View {
    @ObservedObject var signupViewModel = SignupViewModel()
    @State private var selected: String?
    //@Binding var imageData: Data
    @State private var images = ["pfp1", "pfp2", "pfp3","pfp4", "pfp5", "pfp6"]
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach(images, id: \.self) { image in
                    Image(image).resizable().aspectRatio(contentMode: .fill).frame(width: 80, height: 80).overlay(
                        Circle().stroke(selected == image ? Color.primary : Color.clear, lineWidth: 4)
                    ).onTapGesture {
                        self.selected = image
                        let data = UIImage(named:self.selected!)
                        signupViewModel.imageData = (data?.pngData())!

                    }
                }
            }.frame(height: 100).padding()
        }
        
    }
    
//    func convertBase64StringToImage (imageBase64String:String) -> UIImage {
//        let imageData = Data.init(base64Encoded: imageBase64String, options: .init(rawValue: 0))
//        let image = UIImage(data: imageData!)
//        return image!
//    }
}

//struct SelectPFPView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectPFPView()
//    }
//}


//Image("pfp1").resizable().aspectRatio(contentMode: .fill).frame(width: 80, height: 80).overlay(
//    Circle().stroke(Color.clear, lineWidth: 4)
//).onTapGesture {
//    self.selected = "pfp1"
//}
