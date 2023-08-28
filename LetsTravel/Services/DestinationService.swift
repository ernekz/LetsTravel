//
//  DestinationService.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-08-28.
//

import Foundation

class DestinationService {
    
    func fetchAllDestinations(completion: @escaping ([Destination]?) -> Void){
        guard let url = URL(string: "http://localhost:8080/api/destination/getAll") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                print("Error fetching all destinations: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let destinations = try decoder.decode([Destination].self, from: data)
                completion(destinations)
            } catch {
                print("Error decoding destinations: \(error)")
                completion(nil)
            }
        }.resume()
    }
    
    func createDestination(newDestination: CreateDestinationInput, completion: @escaping (Bool) -> Void){
        guard let url = URL(string: "http://localhost:8080/api/destination/create") else {
            completion(false)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(newDestination)
            request.httpBody = jsonData
            
            print("Json data: \(jsonData)")
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error creating destination: \(error)")
                    completion(false)
                    return
                }
                
                completion(true)
            }
            task.resume()
        } catch {
            print("Error encoding destination: \(error)")
            completion(false);
        }
        
    }
}
