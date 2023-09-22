//
//  UserValidation.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-09-22.
//

import Foundation
import CryptoKit

class UserValidation: ObservableObject{
    
    //Hashing the password
    func hashPassword(password: String) -> String? {
        if let passwordData = password.data(using: .utf8){
            let hashed = SHA256.hash(data: passwordData)
            return hashed.compactMap { String(format: "%02x", $0)} .joined()
        }
        return nil
    }
    
    func validatePassword(_ password: String, confirmPassword: String) -> [String]{
        var errorMessages: [String] = []

        if password != confirmPassword {
            errorMessages.append("Password does not match")
        }
        
        if !password.containsCapitalLetter() {
            errorMessages.append("Password must contain at least one capital letter")
        }
        
        if !password.containsNumber() {
            errorMessages.append("Password must contain at least one number")
        }
        
        if password.count < 8 {
            errorMessages.append("Password must be at least 8 characters long")
        }
        
        return errorMessages
    }
    // Validating fields
    
    func isValidEmail() -> Bool {
        let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
    
}

extension String{
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
    
       
}
