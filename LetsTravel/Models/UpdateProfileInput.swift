//
//  UpdateProfileInput.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-09-22.
//

import Foundation

struct UpdateProfileInput: Codable, Hashable {
    let fullName: String
    let bio: String
    let avatar: Data?
    let password: String
}
