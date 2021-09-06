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
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var session: SessionStore

    func sharePost() {
        cameraViewModel.setProfilePic(pfp: session.userSession!.bio)
       // cameraViewModel.uploadPost
        cameraViewModel.sharePost(completed: {
            print("done")
           self.clean()
           self.presentationMode.wrappedValue.dismiss()
        }) { (errorMessage) in
            print("Error: \(errorMessage)")
           self.cameraViewModel.showAlert = true
           self.cameraViewModel.errorString = errorMessage
           self.clean()
        }
    }
    
    func clean() {
        self.cameraViewModel.caption = ""
        self.cameraViewModel.image = Image("upload-icon")
        self.cameraViewModel.imageData = Data()
    }
    
    var body: some View {
        NavigationView {
            
            VStack() {
                Text("Tap to Upload Photo")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    
               
                HStack(alignment: .top) {
                    cameraViewModel.image.resizable().scaledToFill().frame(width: UIScreen.main.bounds.size.width - 30, height: 300).clipped().foregroundColor(.gray).cornerRadius(10).onTapGesture {
                            print("Tapped")
                            self.cameraViewModel.showImagePicker = true
                    }
                    
               }.padding()
                
                //Text("Crop your image to a square for best results.").foregroundColor(.primary).font(.caption)
                
                
                Spacer()
                HStack {
                    TextField("Write a short title...", text: $cameraViewModel.caption).padding(.top, 5).foregroundColor(.primary)
                    
                    
                    NavigationLink(destination: HomeView()) {
                        ZStack{
                            Button(action: sharePost) {
                                Text("Post").padding().background(Color.gray).cornerRadius(5).shadow(radius: 10, x: 0, y: 10).padding()
                            }.alert(isPresented: $cameraViewModel.showAlert) {
                                Alert(title: Text("Error. Please try again."), message: Text(self.cameraViewModel.errorString), dismissButton: .default(Text("OK")))
                            }
                            
                        }
                    
                    }
                    
                    
                    
                    
                    
                    
                }.padding(.leading, 50).padding(.trailing, 50)
                
                
                
                Spacer()
            }
            
            .padding(.top, -50)
            .sheet(isPresented: $cameraViewModel.showImagePicker) {
               // ImagePickerController()
                ImagePicker(showImagePicker: self.$cameraViewModel.showImagePicker, pickedImage: self.$cameraViewModel.image, imageData: self.$cameraViewModel.imageData)
            }.foregroundColor(.black)
        }.foregroundColor(.primary)//.padding(.leading, 15)
        
       
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
