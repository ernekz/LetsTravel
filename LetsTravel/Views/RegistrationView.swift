//
//  RegistrationView.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-09-01.
//

import SwiftUI
import PhotosUI
struct RegistrationView: View {
    
    @StateObject private var viewModel = RegisterViewModel()
    
    @State private var showAlert = false
    
    @State private var email = ""
    @State private var fullName = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @StateObject var imagePicker = ImagePicker()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            // Logo
            
            
            VStack{
                if let image = imagePicker.image {
                    image
                        .resizable()
                        .foregroundColor(.white)
                        .background(.gray)
                        .clipShape(Circle())
                        .frame(width: 150, height: 150)
                } else {
                    Image(systemName: "person")
                        .resizable()
                        .foregroundColor(.white)
                        .background(.gray)
                        .clipShape(Circle())
                        .frame(width: 150, height: 150)
                }
                
                PhotosPicker(selection: $imagePicker.imageSelection) {
                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }.padding(.top, 24)
            
            //Input fields
            
            VStack(spacing: 24){
                InputView(text: $viewModel.registrationInput.email,
                          title: "Email Address",
                          placeholder: "name@example.com",
                          error: viewModel.email.errorMessage ?? "")
                .autocapitalization(.none)
                
                InputView(text: $viewModel.registrationInput.fullName,
                          title: "Full Name",
                          placeholder: "Enter your name",
                          error: viewModel.fullName.errorMessage ?? "")
                
                InputView(text: $viewModel.passwordToBeHashed,
                          title: "Password",
                          placeholder: "Enter your Password",
                          error: viewModel.password.errorMessage ?? "",
                          isSecureField: true)
                
                InputView(text: $viewModel.confirmPassword,
                          title: "Confirm Password",
                          placeholder: "Confirm your Password",
                          error: viewModel.rePassword.errorMessage ?? "",
                          isSecureField: true)
                
                InputView(text: $viewModel.registrationInput.bio,
                          title: "Bio",
                          placeholder: "Create your bio",
                          error: viewModel.bio.errorMessage ?? "")
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            
            
            
            //Sign in button
            
            
            Button{
                viewModel.checkEmailAvailability { isEmailFree in
                        if isEmailFree {
                            viewModel.submitRegistration { success in
                                if success {
                                    showAlert = true
                                    print("Successful registration")
                                } else {
                                    print("Registration failed")
                                }
                            }
                        } else {
                            print("Email is already taken")
                        }
                    }
            } label: {
                HStack{
                    Text("Sign up")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color(.systemBlue))
            .cornerRadius(15)
            .padding(.top, 24)
            .alert(isPresented: $showAlert){
             Alert(
                
                title: Text("Registration successful"),
                message: Text("Your registration was successful. You can now log in."),
                primaryButton: .default(Text("OK")){
                    dismiss()
                },
                secondaryButton: .cancel()
             )
                
            }
            
            Spacer()
            
            
            //Sign up button
            
            Button{
                dismiss()
            } label: {
                HStack(spacing: 3){
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            }
        }
        
    }
    
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
