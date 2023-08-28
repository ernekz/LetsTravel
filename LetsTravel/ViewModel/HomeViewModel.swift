//
//  ContinentsViewModel.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-08-25.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var continents: [Continent] = []
    @Published var destinations: [Destination] = []
    
    private let continentService = ContinentService()
    private let destinationService = DestinationService()
    
    func fetchContinents(){
        continentService.fetchContinents { [weak self] continents in
            DispatchQueue.main.async {
                self?.continents = continents ?? []
            }
        }
    }
    
    func fetchDestinations(){
        destinationService.fetchAllDestinations{ [weak self] destinations in
            DispatchQueue.main.async {
                self?.destinations = destinations ?? []
                print("Fetched destinations: \(destinations ?? [])")
            }
        }
    }
}
