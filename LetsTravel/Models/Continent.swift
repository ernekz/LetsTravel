//
//  Continent.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-08-25.
//

import Foundation

struct Continent: Identifiable, Decodable, Hashable, Equatable {
    let id: Int
    let name: String
}
