//
//  LoginView.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-09-01.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        NavigationView{
            
            VStack{
                // Logo
                Image("Logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 240)
                    .padding(.vertical, 32)
                
                
                //Input fields
                
                VStack(spacing: 24){
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .autocapitalization(.none)
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your Password",
                              isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                
                
                
                //Sign in button
                
                
                Button{
                    
                } label: {
                    HStack{
                        Text("Sign in")
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
                
                NavigationLink{
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3){
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
            }
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
