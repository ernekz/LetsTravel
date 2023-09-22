//
//  ProfileViewModel.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-09-11.
//

import Foundation
import SwiftUI

class ProfileViewModel: ObservableObject{
    @Published var destinations: [Destination] = []
    @Published var user: User = User(email: "", fullName: "", bio: "", avatar: Data())
    
    @Published var updateUser: UpdateProfileInput = UpdateProfileInput(fullName: "", bio: "", avatar: Data(), password: "")
    
    @Published var confirmPassword: String = ""
    private let destinationService = DestinationService.shared
    private let userService = UserService.shared
    
    @Published var selectedImage: UIImage?
    
    
    func fetchUser(){
        userService.fetchCurrentUser{ [weak self] user in
            DispatchQueue.main.async {
                if let user = user {
                    self?.user = user
                    print("Fetched User: \(String(describing: self?.user))")
                } else {
                    print("User not found")
                }
                
            }
        }
        
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
    
    func updateUser(completion: @escaping (Bool) -> Void){
        userService.updateUser(updateProfile: updateUser, completion: completion)
        
    }
}
