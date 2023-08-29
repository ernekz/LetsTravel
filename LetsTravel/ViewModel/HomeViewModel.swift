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
    private let destinationService = DestinationService.shared
    
    @Published var popularContinent = Continent(id: -1, name: "Popular")
    
    
    var allContinents: [Continent]{
        return [popularContinent] + continents
    }
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
                
            }
        }
    }
    
    func fetchDestinationsByContinent(continentId: Int){
        destinationService.fetchDestinationsByContinentId(continentId: continentId) {[weak self] destinations in
            DispatchQueue.main.async {
                self?.destinations = destinations ?? []
            }
        }
    }
}
