//
//  SelectPFPView.swift
//  Mushfeed
//
//  Created by Alek Michelson on 3/27/21.
//

import SwiftUI

struct SelectPFPView: View {
    @State private var selected: String?
    @State var imageData: Data = Data()
    @ObservedObject var signupViewModel = SignupViewModel()
    private var images = ["pfp1", "pfp2", "pfp3","icon5", "icon6", "icon7"]
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach(images, id: \.self) { image in
                    Image(image).resizable().padding(.leading, 5).aspectRatio(contentMode: .fill).frame(width: 80, height: 80).overlay(
                        Circle().stroke(selected == image ? Color.primary : Color.clear, lineWidth: 4).frame(width: 90, height:90)
                    ).onTapGesture {
                        self.selected = image
                        let uiImage = UIImage(named: image)
                        let data = uiImage?.jpegData(compressionQuality: 0.5)
                        
                        if (data) != nil {
                            self.imageData = data!
                            self.signupViewModel.setImage(imageD: data!)
                            print("State var imageData: ", imageData)
                            print("signupViewModel imageData: ", self.signupViewModel.imageData)
                        }

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
