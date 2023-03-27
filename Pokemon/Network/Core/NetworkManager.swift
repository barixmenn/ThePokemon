//
//  NetworkManager.swift
//  Pokemon
//
//  Created by Baris on 28.03.2023.
//


import Foundation
import Alamofire

final class NetworkManager: NetworkManagerProtocol {
    static let shared = NetworkManager()
}

extension NetworkManager {
    
    func request<T:Codable>(type: T.Type, url: String, method: HTTPMethod, completion: @escaping((Result<T,ErrorType>) ->Void)) {
        AF.request(url, method: method).responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let data):
                        completion(.success(data))
                    case .failure(_):
                        completion(.failure(.generalError))
                    }
            }
    }
}
