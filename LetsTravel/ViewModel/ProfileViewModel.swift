//
//  ProfileViewModel.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-09-11.
//

import Foundation

class ProfileViewModel: ObservableObject{
    @Published var destinations: [Destination] = []
    
    private let destinationService = DestinationService.shared
    
    
    func fetchUser(){
        
        
    }
    
    func fetchUserDestinations(){
        destinationService.fetchDestinationsCurrentUser{ [weak self] destinations in
            DispatchQueue.main.async {
                self?.destinations = destinations ?? []
                print("Fetched Destinations: \(String(describing: self?.destinations))")
            }
        }
        
    }
    
    func fetchUserLikedDestinations(){
        
        
    }
    
    func fetchUserPosts(){
        
    }
}
