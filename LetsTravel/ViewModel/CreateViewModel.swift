//
//  CreateViewModel.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-08-25.
//

import Foundation


class CreateViewModel: ObservableObject {
    
    private let continentService = ContinentService()
    private let destinationService = DestinationService.shared
    private let userService = UserService.shared
    
    @Published var createInput = CreateDestinationInput(
            country: "",
            continentId: 0,
            createdBy: 0,
            city: "",
            people: "",
            leavingDate: "",
            returningDate: "",
            description: "",
            imageUrl: "image_url"
            )
    
    @Published var selectedContinentId: Int = 1
    @Published var continents: [Continent] = []
    @Published var countryError = ""
    @Published var lDate = Date()
    @Published var rDate = Date()
    
    
    @Published var country = FieldValidator()
    @Published var continent = FieldValidator()
    @Published var city = FieldValidator()
    @Published var people = FieldValidator()
    @Published var description = FieldValidator()
    @Published var dates = FieldValidator()
    var isFormValid: Bool{
        
        var isValid = true
        country.errorMessage = createInput.country.isEmpty ? "Country cannot be empty" : nil
        continent.errorMessage = selectedContinentId == 0 ? "Continent cannot be empty" : nil
        createInput.continentId = selectedContinentId
        city.errorMessage = createInput.city.isEmpty ? "City cannot be empty" : nil
        people.errorMessage = createInput.people.isEmpty ? "People cannot be empty" : nil
        description.errorMessage = createInput.description.isEmpty ? "Description cannot be empty" : nil
        dates.errorMessage = rDate < lDate ? "Return date cannot be earlier than leaving date" : nil
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        createInput.leavingDate = dateFormatter.string(from: lDate)
        createInput.returningDate = dateFormatter.string(from: rDate)
        isValid = !country.isEmpty && !continent.isEmpty && !city.isEmpty && !people.isEmpty && !dates.isEmpty
        return isValid
    }
    
    
    func submit(completion: @escaping (Bool) -> Void){
        guard isFormValid else {
            completion(false)
            return
        }
            
            print("City: \(createInput.city)")
            print("People: \(createInput.people)")
            print("Start Date: \(createInput.leavingDate)")
            print("End Date: \(createInput.returningDate)")
            print("Description: \(createInput.description)")
        print("createdBy: \(createInput.createdBy)")
        
        destinationService.createDestination(newDestination: createInput, completion: completion)
        
        
    }
    
    func fetchContinents(){
        continentService.fetchContinents{ [weak self] continents in
            DispatchQueue.main.async {
                self?.continents = continents ?? []
                print("Fetched continents: \(continents ?? [])")
            }
        }
    }
    
    func cleanTheForm(){
        createInput = CreateDestinationInput(
                country: "",
                continentId: 0,
                createdBy: 123,
                city: "",
                people: "",
                leavingDate: "",
                returningDate: "",
                description: "",
                imageUrl: "image_url"
                )
        lDate = Date()
        rDate = Date()
    }
    
    func fetchId(){
        userService.userId{ userId in
            
            if let userId = userId {
                self.createInput.createdBy = userId
            } else {
                print("Failed to fetch user ID")
            }
        }
    }
    
}
