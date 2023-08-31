//
//  Destination.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-08-28.
//

import Foundation


struct Destination: Identifiable, Decodable, Equatable, Hashable {
    
    let id: Int
    let continentId: Int
    let city: String
    let country: String
    let people: Int
    let leavingDate: String?
    let returningDate: String?
    let imageUrl: String?
    let description: String
    
}
