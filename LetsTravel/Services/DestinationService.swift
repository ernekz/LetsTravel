//
//  DestinationService.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-08-28.
//

import Foundation

class DestinationService {
    
    static let shared = DestinationService()
    
    private let networkRequestManager = NetworkRequestManager.shared
    
    private init(){}
    
    private let baseURL = "http://localhost:8080/api/v1/destination"
    
    private func createURL(with path: String) -> URL? {
        return URL(string: baseURL + path)
    }
    
    func fetchAllDestinations(completion: @escaping ([Destination]?) -> Void){
        guard let url = createURL(with: "/getAll") else {
            completion(nil)
            return
        }
        
        networkRequestManager.performGetRequest(url: url) { (result: Result<[Destination], Error>) in
            switch result{
            case .success(let destinations):
                completion(destinations)
            case .failure(let error):
                print("Error fetching all destinations: \(error)")
                completion(nil)
            }
        }
    }
    
    func createDestination(newDestination: CreateDestinationInput, completion: @escaping (Bool) -> Void){
        guard let url = createURL(with: "/create") else {
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
            
            networkRequestManager.performPostRequest(url: url, requestData: request) { result in
                switch result {
                case .success:
                    completion(true)
                case .failure(let error):
                    print("Error creating destination: \(error)")
                    completion(false)
                }
            }
        } catch {
            print("Error encoding destination: \(error)")
            completion(false);
        }
        
    }
    
    func fetchDestinationsByContinentId(continentId: Int, completion: @escaping ([Destination]?) -> Void) {
        guard let url = createURL(with: "/getByContinent/\(continentId)") else {
            completion(nil)
            return
        }
        
        networkRequestManager.performGetRequest(url: url) { (result: Result<[Destination], Error>) in
            switch result {
            case .success(let destinations):
                completion(destinations)
            case .failure(let error):
                print("Error fetching destination by continent: \(error)")
                completion(nil)
            }
            
        }
        
    }
    
    
    func fetchDestinationsCurrentUser(completion: @escaping ([Destination]?) -> Void){
        guard let url = createURL(with: "/byCurrentUser") else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        if let jwtToken = UserDefaults.standard.string(forKey: "jwtToken") {
            // Remove the "token" key from the JWT token string
            let cleanedJwtToken = jwtToken.replacingOccurrences(of: "{\"token\":\"", with: "").replacingOccurrences(of: "\"}", with: "")
            request.setValue("Bearer \(cleanedJwtToken)", forHTTPHeaderField: "Authorization")
        } else {
            print("JWT Token not found")
        }
        
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error{
                print("Error fetching destinations by current user: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }
            
            do{
                let destinations = try JSONDecoder().decode([Destination].self, from: data)
                completion(destinations)
            } catch {
                print("Error decoding destinations: \(error)")
                completion(nil)
            }
            
        }.resume()
    }
    
    
    //Fetching Kafka messages about newly created destinations for real-time update
    
    func fetchKafkaMessages(completion: @escaping ([Destination]?) -> Void){
        guard let url = URL(string:"http://localhost:8081/api/message") else {
            completion(nil)
            return
        }
        
        networkRequestManager.performGetRequest(url: url) {(result: Result<[Destination], Error>) in
            switch result {
            case .success(let destinations):
                    completion(destinations)
            case .failure(let error):
                print("Error receiving messages from kafka: \(error)")
                completion(nil)
            }
            
        }
    }
}
