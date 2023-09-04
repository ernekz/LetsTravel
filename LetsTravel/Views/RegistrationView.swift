//
//  RegistrationView.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-09-01.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject private var viewModel = RegisterViewModel()
    
    @State private var email = ""
    @State private var fullName = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            // Logo
            Image("Logo")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 240)
                .padding(.vertical, 32)
            
            
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
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            
            
            
            //Sign in button
            
            
            Button{
                viewModel.checkEmailAvailability()
                viewModel.submitRegistration { success in
                    if success{
                        print("Successful registration")
                    } else {
                        print("Registration failed")
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
