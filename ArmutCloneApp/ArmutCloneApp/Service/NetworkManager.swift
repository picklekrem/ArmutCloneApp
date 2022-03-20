//
//  NetworkManager.swift
//  ArmutCloneApp
//
//  Created by Ekrem Özkaraca on 20.03.2022.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init () {}
    
    struct Constants {
        static let baseAPIURL = "https://my-json-server.typicode.com/engincancan/case"
    }
    
    enum HTTPMethod: String {
        case GET
        case POST
        case DELETE
        case PUT
    }
    enum APIError : Error {
        case failedToGetData
    }
    
    private func createRequest (with url: URL?, type: HTTPMethod, completion: @escaping (URLRequest) -> Void) {
            guard let apiURL = url else {return}
            let request = URLRequest(url: apiURL)
            completion(request)
    }
    
    public func getHomePageData(completion: @escaping ((Result<Home,Error>)) -> Void) {
        createRequest(with: URL(string: Constants.baseAPIURL + "/home"), type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(Home.self, from: data)
                    completion(.success(result))
//                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
//                    print(json)
                }catch {
                    completion(.failure(error))
                }
            }.resume()
        }
    }
    
    public func getServiceDetails(id : Int, completion: @escaping ((Result<ServicesModel,Error>)) -> Void) {
        createRequest(with: URL(string: Constants.baseAPIURL + "/service/\(id)"), type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(ServicesModel.self, from: data)
                    completion(.success(result))
//                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
//                    print(json)
                }catch {
                    completion(.failure(error))
                }
            }.resume()
        }
    }
    
}
