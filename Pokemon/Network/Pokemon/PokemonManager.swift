//
//  PokemonManager.swift
//  Pokemon
//
//  Created by Baris on 28.03.2023.
//


import Foundation

protocol PokemonManagerProtocol {
    func fetchPokemon(complete: @escaping((GetPokemonsResponse?,Error?) -> ()))
}

final class PokemonManager: PokemonManagerProtocol {
    static let shared = PokemonManager()
}

extension PokemonManager {
    func fetchPokemon(complete: @escaping ((GetPokemonsResponse?, Error?) -> ())) {
        NetworkManager.shared.request(type: GetPokemonsResponse.self, url: Constant.ServiceEndPoint.pokemonEndPoint(), method: .get) { response in
            switch response {
            case .success(let data):
                complete(data,nil)
            case .failure(let error):
                complete(nil,error)
            }
        }
    }
    
}
