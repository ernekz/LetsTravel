//
//  ContinentService.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-08-25.
//

import Foundation

class ContinentService {
    func fetchContinents(completion: @escaping ([Continent]?) -> Void){
        
        guard let url = URL(string: "http://localhost:8080/api/v1/continents/getAll") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            if let error = error{
                //print("Error Fetching continents: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let continents = try decoder.decode([Continent].self, from: data)
                completion(continents)
            } catch {
                //print("Error decoding continets: \(error)")
                completion(nil)
            }
        }.resume()
    }
}
