//
//  NetworkManagerProtocol.swift
//  Pokemon
//
//  Created by Baris on 28.03.2023.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol {
    func request<T:Codable>(type: T.Type, url: String, method: HTTPMethod, completion: @escaping((Result<T,ErrorType>) ->Void))
}
