//
//  RegisterViewModel.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-09-01.
//

import Foundation
import CryptoKit

class RegisterViewModel: ObservableObject {
    
    private let userService = UserService.shared
    
    @Published var confirmPassword = ""
    @Published var registrationInput = RegistrationInput(
        email: "",
        fullName: "",
        password: ""
    
    )
    
    @Published var passwordToBeHashed = ""
    
    @Published var isEmailFree: Bool = true
    
    @Published var email = FieldValidator()
    @Published var fullName = FieldValidator()
    @Published var password = FieldValidator()
    @Published var rePassword = FieldValidator()
    
    
    
    func hashPassword(password: String) -> String? {
        if let passwordData = password.data(using: .utf8){
            let hashed = SHA256.hash(data: passwordData)
            return hashed.compactMap { String(format: "%02x", $0)} .joined()
        }
        return nil
    }
    
    
    
    
    
    var isRegistrationValid: Bool{
        var isValid = true
        
        email.errorMessage = registrationInput.email.isEmpty ? "Email cannot be empty": nil
        password.errorMessage = passwordToBeHashed.isEmpty ? "Password cannot be empty": nil
        fullName.errorMessage = registrationInput.fullName.isEmpty ? "Full name cannot be empty": nil
        
        
        if isEmailFree && !registrationInput.email.isEmpty{
            if !registrationInput.email.isValidEmail(){
                isValid = false
                email.errorMessage = "Please ensure that email is proper format"
            }
        } else if !isEmailFree && !registrationInput.email.isEmpty {
            isValid = false
            email.errorMessage = "Email is already taken"
        }
        
        if passwordToBeHashed != confirmPassword{
            isValid = false
            password.errorMessage = "Password do not match"
        } else if !passwordToBeHashed.containsCapitalLetter() {
            isValid = false
            password.errorMessage = "Password must contain at least one capital letter"
        } else if !passwordToBeHashed.containsNumber() {
            isValid = false
            password.errorMessage = "Password must contain at least one number"
        } else if passwordToBeHashed.count < 8 {
            isValid = false
            password.errorMessage = "Password must be at least 8 characters long"
        }
        
        
        return isValid
    }
    
    
    func checkEmailAvailability(){

        userService.checkEmailAvailability(email: registrationInput.email) { [weak self] result in
                DispatchQueue.main.async {
                    switch result{
                    case .success(let isAvailable):
                        self?.isEmailFree = isAvailable
                    case .failure(let error):
                        print("Error checking email availability: \(error)")
                    }

                }
        }
    }
    
    func submitRegistration(completion: @escaping (Bool) -> Void){
        
        guard isRegistrationValid else {
            completion(false)
            return
        }
        
        print("Submitting...")
        print("email: \(registrationInput.email)")
        print("fullName: \(registrationInput.fullName)")
        
        registrationInput.password = hashPassword(password: passwordToBeHashed)!
        print("password: \(registrationInput.password)")
        
        // calling api to register user
        
        userService.registerUser(newRegister: registrationInput, completion: completion)
        
    }
}

extension String {
    func containsCapitalLetter() -> Bool {
            let capitalLetterRegEx = ".*[A-Z]+.*"
            let textPred = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
            return textPred.evaluate(with: self)
        }
        
        func containsNumber() -> Bool {
            let numberRegEx = ".*[0-9]+.*"
            let textPred = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
            return textPred.evaluate(with: self)
        }
    
        func isValidEmail() -> Bool {
            let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            return emailPredicate.evaluate(with: self)
        }
}
