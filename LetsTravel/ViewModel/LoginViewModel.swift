//
//  LoginViewModel.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-09-01.
//

import Foundation
import CryptoKit

class LoginViewModel: ObservableObject{
    
    
    
    private let userService = UserService.shared
    
    @Published var loginInput = LoginInput(
        email: "",
        password: ""
    )
    
    @Published var passwordToBehashed: String = ""
    
    func hashPassword(password: String) -> String? {
        if let passwordData = password.data(using: .utf8){
            let hashed = SHA256.hash(data: passwordData)
            return hashed.compactMap { String(format: "%02x", $0)} .joined()
        }
        return nil
    }
    
    
    
    func login(completion: @escaping (Bool) -> Void){
        
        loginInput.password = hashPassword(password: passwordToBehashed)!
        
        print("Submitting...")
        print("email: \(loginInput.email)")
        print("password: \(loginInput.password)")
        
        userService.loginUser(newLogin: loginInput) { result in
            switch result{
            case .success(let token):
                print("JWT Token: \(token)")
            case .failure(let error):
                print("Error loggin in: \(error)")
            }

        }
    }
    
    func logout(completion: @escaping (Bool) -> Void){
        
        print("Logging out")
        
        userService.logoutUser{ success in
            if success {
                completion(true)
            } else {
                completion(false)
            }
        }
        
        
    }
    
}
