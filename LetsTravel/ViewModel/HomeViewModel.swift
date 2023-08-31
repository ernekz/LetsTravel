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
    
    @Published var activeRegion: Int? = nil
    
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
    
    func fetchUpdatedDestinations(){
        destinationService.fetchKafkaMessages{ [weak self] newDestinations in
            DispatchQueue.main.async {
                guard let self = self, let newDestinations = newDestinations else{
                    return
                }
                
                let filteredNewDestinations = newDestinations.filter { newDestination in
                    return newDestination.continentId == self.activeRegion
                    
                }
                var uniqueDestinations = Set(self.destinations)
                uniqueDestinations.formUnion(newDestinations)
                self.destinations = Array(uniqueDestinations)
                
            }
        }
    }
}
