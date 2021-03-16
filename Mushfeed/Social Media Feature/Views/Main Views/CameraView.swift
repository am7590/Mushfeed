//
//  CameraView.swift
//  instagram
//
//  Created by Alek Michelson on 8/7/20.
//  Copyright © 2020 Alek Michelson. All rights reserved.
//

import SwiftUI


struct CameraView: View {
    @ObservedObject var cameraViewModel = CameraViewModel()

    func sharePost() {
       // cameraViewModel.uploadPost
        cameraViewModel.sharePost(completed: {
           print("done")
           self.clean()
        }) { (errorMessage) in
            print("Error: \(errorMessage)")
           self.cameraViewModel.showAlert = true
           self.cameraViewModel.errorString = errorMessage
           self.clean()
        }
    }
    
    func clean() {
        self.cameraViewModel.caption = ""
        self.cameraViewModel.image = Image("cameraView")
        self.cameraViewModel.imageData = Data()
    }
    
    var body: some View {
        NavigationView {
            
            VStack() {
                Text("New Post")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
               
                HStack(alignment: .top) {
                
                    cameraViewModel.image.resizable().scaledToFill().frame(width: 300, height: 160).clipped().foregroundColor(.gray).cornerRadius(25).onTapGesture {
                            print("Tapped")
                            self.cameraViewModel.showImagePicker = true
                    }
                    
               }.padding()
                
                Spacer()
                HStack {
                    TextField("Write a short title...", text: $cameraViewModel.caption).padding(.top, 5)
                    
                    
                    NavigationLink(destination: HomeView()) {
                        ZStack{
                            Button(action: sharePost) {
                                Image(systemName: "arrow.turn.up.right").imageScale(Image.Scale.large).foregroundColor(.gray)
                            }.alert(isPresented: $cameraViewModel.showAlert) {
                                Alert(title: Text("Error"), message: Text(self.cameraViewModel.errorString), dismissButton: .default(Text("OK")))
                            }
                        }
                    
                    }
                    
                    
                    
                    
                    
                    
                }.padding(.leading, 50).padding(.trailing, 50)
                
                
                
                Spacer()
            }.padding(.top, -50)
            .sheet(isPresented: $cameraViewModel.showImagePicker) {
               // ImagePickerController()
                ImagePicker(showImagePicker: self.$cameraViewModel.showImagePicker, pickedImage: self.$cameraViewModel.image, imageData: self.$cameraViewModel.imageData)
            }.foregroundColor(.black)
        }//.padding(.leading, 15)
        
       
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
