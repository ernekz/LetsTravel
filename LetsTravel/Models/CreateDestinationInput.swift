//
//  CreateDestinationInput.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-08-25.
//

import Foundation

struct CreateDestinationInput: Encodable {
    var country: String
    var continentId: Int
    var createdBy: Int64
    var city: String
    var people: String
    var leavingDate: String
    var returningDate: String
    var description: String
    var imageUrl: Data
}
