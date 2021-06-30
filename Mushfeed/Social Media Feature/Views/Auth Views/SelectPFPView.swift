//
//  SelectPFPView.swift
//  Mushfeed
//
//  Created by Alek Michelson on 3/27/21.
//

import SwiftUI

struct SelectPFPView: View {
    @Binding var imageName: String
    @State private var selected: String?
    @State var imageData: Data = Data()
    @ObservedObject var signupViewModel = SignupViewModel()
    var images = ["pfp1", "pfp2", "pfp3","icon5", "icon6", "icon7"]
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach(images, id: \.self) { image in
                    Image(image).resizable().padding(.leading, 5).aspectRatio(contentMode: .fill).frame(width: 80, height: 80).overlay(
                        Circle().stroke(selected == image ? Color.primary : Color.clear, lineWidth: 4).frame(width: 90, height:90)
                    ).onTapGesture {
                        self.selected = image
                        imageName = image
                        signupViewModel.setImage(imageN: image)
                        
                        
                        
                        
                        
//                        let uiImage = UIImage(named: image)
//                        let data = uiImage?.jpegData(compressionQuality: 0.5)
//                        
//                        if (data) != nil {
//                            self.imageData = data!
//                            self.signupViewModel.setImage(imageD: data!)
//                            print("State var imageData: ", imageData)
//                            print("signupViewModel imageData: ", self.signupViewModel.imageData)
//                        }

                    }
                }
            }.frame(height: 100).padding()
        }
        
    }
    
}

//struct SelectPFPView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectPFPView()
//    }
//}

