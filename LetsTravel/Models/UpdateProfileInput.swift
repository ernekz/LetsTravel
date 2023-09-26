//
//  UpdateProfileInput.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-09-22.
//

import Foundation

struct UpdateProfileInput: Codable, Hashable {
    var email: String
    var fullName: String
    var bio: String
    var avatar: Data?
    var password: String
}
