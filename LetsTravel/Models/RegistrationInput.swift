//
//  RegistrationInput.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-09-04.
//

import Foundation

struct RegistrationInput: Encodable, Hashable {
    var email: String
    var fullName: String
    var password: String
    var bio: String
    var avatar: Data?
}
