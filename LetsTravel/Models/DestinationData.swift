//
//  DestinationData.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-08-24.
//

import Foundation

struct DestinationData: Identifiable{
    let id: Int
    let city: String
    let country: String
    let people: Int
    let leavingDate: String
    let returningDate: String
    let imageUlr: String
    let description: String
    
    static let sampleData: [DestinationData] = [
        DestinationData(id: 1, city: "Paris", country: "France", people: 5, leavingDate: "2023-09-01", returningDate: "2023-09-10", imageUlr: "imgurl", description: "easy trip for a good vacation"),
        DestinationData(id: 2, city: "Tokyo", country: "Japan", people: 5, leavingDate: "2023-09-01", returningDate: "2023-09-10", imageUlr: "imgurl", description: "easy trip for a good vacation"),
        DestinationData(id: 3, city: "New York", country: "USA", people: 5, leavingDate: "2023-09-01", returningDate: "2023-09-10", imageUlr: "imgurl", description: "easy trip for a good vacation"),
        
    ]
    
}
