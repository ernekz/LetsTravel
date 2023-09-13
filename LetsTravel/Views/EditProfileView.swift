//
//  EditProfileView.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-09-13.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = ProfileViewModel()
    @State private var isImagePickerPresented = false
    @Binding var isImagePresented: Bool
    @State private var fullName = ""
    @State private var bio = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        
        VStack{
            VStack{
                
                // ToolBar
                HStack{
                    Button{
                        viewModel.selectedImage = nil
                        presentationMode.wrappedValue.dismiss()
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
                if let image = viewModel.selectedImage {
                    Image(uiImage: image)
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
                
                Button{
                    isImagePresented = true
                } label: {
                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            
            .navigationBarBackButtonHidden(true)
                    
            VStack{
                EditProfileRowView(title: "Name", placeholder: "Enter name", text: $fullName, error: "")
                EditProfileRowView(title: "Bio", placeholder: "Enter bio", text: $bio, error: "")
                EditProfileRowView(title: "Password", placeholder: "Change password", text: $password, error: "", isSecureField: true)
                EditProfileRowView(title: "Confirm password", placeholder: "Change password", text: $password, error: "", isSecureField: true)

            }
            .padding(.horizontal)
            .padding(.top, 2)
            
            Spacer()
           
            
        }.sheet(isPresented: $isImagePresented) {
            ImagePicker(selectedImage: $viewModel.selectedImage, isPresented: $isImagePresented)
        }
        //NavigationLink(
          //  destination: ImagePicker(selectedImage: $viewModel.selectedImage, isPresented: $isImagePickerPresented),
           // isActive: $isImagePickerPresented,
           // label: { EmptyView() }
                
        //)

    }
}

struct EditProfileView_Previews: PreviewProvider {
    @State static var isImagePresented = false
    static var previews: some View {
        EditProfileView(isImagePresented: $isImagePresented)
    }
}
