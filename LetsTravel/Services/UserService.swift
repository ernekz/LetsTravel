//
//  UserService.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-09-04.
//

import Foundation

class UserService{
    
    static let shared = UserService()
    
    private let networkRequestManager = NetworkRequestManager.shared
    
    private init(){}
    
    private let baseURL = "http://localhost:8443/api/v1/user"
    
    private func createURL(with path: String) -> URL? {
        return URL(string: baseURL + path)
    }
    
    func checkEmailAvailability(email: String, completion: @escaping (Result<Bool, Error>) -> Void){
        guard let url = createURL(with: "/emailTaken?email=\(email)") else {
            completion(.failure(NSError(domain: "InvalidURL", code: 0, userInfo: nil)))
            return
        }
        
        networkRequestManager.performGetRequest(url: url) { (result: Result<Bool, Error>) in
            switch result {
            case .success(let isAvailable):
                completion(.success(isAvailable))
                print("Email is available")
            case .failure(let error):
                completion(.failure(error))
                print("Email is taken")
            }
        }
        
    }
    
    func registerUser(newRegister: RegistrationInput, completion: @escaping (Bool) -> Void) {
        
        guard let url = createURL(with: "/register") else {
            completion(false)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do{
            let jsonData = try JSONEncoder().encode(newRegister)
            request.httpBody = jsonData
            
            print("Json data: \(jsonData)")
            
            networkRequestManager.performPostRequest(url: url, requestData: request) { result in
                switch result {
                case .success:
                    completion(true)
                case .failure(let error):
                    print("Error creating user: \(error)")
                    completion(false)
                }
            }
        } catch {
            print("Error encoding user: \(error)")
            completion(false)
        }
    }
    
    func loginUser(newLogin: LoginInput, completion: @escaping (Result<String, Error>) -> Void){
        guard let url = createURL(with: "/login") else {
            completion(.failure(NetworkError.requestFailed))
            print("request failed")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(newLogin)
            request.httpBody = jsonData
            
            print("Json data: \(jsonData)")
            
            networkRequestManager.performPostRequest(url: url, requestData: request) { result in
                switch result {
                case .success(let data):
                    if let token = String(data: data, encoding: .utf8){
                        UserDefaults.standard.set(token, forKey: "jwtToken")
                        completion(.success(token))
                    }else {
                        completion(.failure(NetworkError.emptyData))
                    }
                case .failure(let error):
                    print("Error loging user : \(error)")
                    completion(.failure(NetworkError.decodingFailed))
                }
            }
            
            
        } catch {
            print("Error encoding login: \(error)")
            completion(.failure(error))
        }
        
    }
    
    
    func logoutUser(completion: @escaping (Bool) -> Void){
        guard let url = createURL(with: "/logout") else {
            print("request failed")
            completion(false)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "Post"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let jwtToken = UserDefaults.standard.string(forKey: "jwtToken"){
            request.setValue("Bearer \(jwtToken)", forHTTPHeaderField: "Authorization")
        }
        
        networkRequestManager.performPostRequest(url: url, requestData: request){ result in
            switch result{
            case .success:
                UserDefaults.standard.removeObject(forKey: "jwtToken")
                completion(true)
            case .failure(let error):
                print("Error logging out: \(error)")
                completion(false)
            }
        }
    }
}
