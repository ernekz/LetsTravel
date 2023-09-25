//
//  EditDestinationView.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-09-25.
//

import SwiftUI
import PhotosUI

struct EditDestinationView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = ProfileViewModel()
    @State private var isImagePickerPresented = false
    
    @StateObject var imagePicker = ImagePicker()
    
    @EnvironmentObject private var routerManager: NavigationRouter
    var body: some View {
        VStack{
            VStack{
                
                // ToolBar
                HStack{
                    Button{
                        //routerManager.goBack()
                    } label: {
                        Text("Cancel")
                    }
                    
                    Spacer()
                    
                    Text("Edit profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button{
                        print("Update profile info")
//                        viewModel.updateUser { success in
//                            if success{
//                                print("Successfully updated profile")
//                            } else {
//                                print("Update failed")
//                            }
//                        }
                        
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                }
                .padding(.horizontal)
                Divider()
            }
            
            VStack{
                if let image = imagePicker.image {
                    image
                        .resizable()
                        .foregroundColor(.white)
                        .background(.gray)
                        .clipShape(Circle())
                        .frame(width: 80, height: 80)
                } else {
                    Image(systemName: "person")
                        .resizable()
                        .foregroundColor(.white)
                        .background(.gray)
                        .clipShape(Circle())
                        .frame(width: 80, height: 80)
                }
                
                PhotosPicker(selection: $imagePicker.imageSelection) {
                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            
            .navigationBarBackButtonHidden(true)
                    
            VStack{
                EditProfileRowView(title: "Name", placeholder: "Enter name", text: $viewModel.updateUser.fullName, error: "")
                EditProfileRowView(title: "Bio", placeholder: "Enter bio", text: $viewModel.updateUser.bio, error: "")
                EditProfileRowView(title: "Password", placeholder: "Change password", text: $viewModel.updateUser.password, error: "", isSecureField: true)
                EditProfileRowView(title: "Confirm password", placeholder: "Change password", text: $viewModel.confirmPassword, error: "", isSecureField: true)

            }
            .padding(.horizontal)
            .padding(.top, 2)
            
            Spacer()
           
            
        }
        

    }
}

struct EditDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        EditDestinationView()
    }
}
