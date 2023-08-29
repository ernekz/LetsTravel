//
//  NetworkRequestManager.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-08-29.
//

import Foundation

enum NetworkError: Error {
    case emptyData
    case requestFailed
    case decodingFailed
}

class NetworkRequestManager {
    
    static let shared = NetworkRequestManager()
    
    private init() {}
    
    func performGetRequest<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.emptyData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    
    
    
    func performPostRequest(url: URL, requestData: URLRequest, completion: @escaping (Result<Data, NetworkError>) -> Void){
        URLSession.shared.dataTask(with: requestData) { data, response, error in
            if error != nil{
                completion(.failure(.requestFailed))
                return
            }
            
            if let data = data {
                completion(.success(data))
            } else {
                completion(.failure(NetworkError.emptyData))
            }
        }.resume()
    }
}
