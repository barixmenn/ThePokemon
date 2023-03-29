//
//  PokemonManager.swift
//  Pokemon
//
//  Created by Baris on 28.03.2023.
//


import Foundation

protocol PokemonManagerProtocol {
    func fetchPokemons(complete: @escaping((PokemonsResponse?,Error?) -> ()))
    func fetchPokemonSprites(id:String) -> URL?
    func fetchPokemon(id: String, complete: @escaping((PokemonDetailResponse?,Error?) -> ()))
}

final class PokemonManager: PokemonManagerProtocol {
    
    static let shared = PokemonManager()
}

extension PokemonManager {
    
    func fetchPokemons(complete: @escaping ((PokemonsResponse?, Error?) -> ())) {
        NetworkManager.shared.request(type: PokemonsResponse.self, url: ServiceEndPoint.pokemonEndPoint(), method: .get) { response in
            switch response {
            case .success(let data):
                complete(data,nil)
            case .failure(let error):
                complete(nil,error)
            }
        }
    }
    func fetchPokemon(id: String, complete: @escaping ((PokemonDetailResponse?, Error?) -> ())) {
        NetworkManager.shared.request(type: PokemonDetailResponse.self, url: ServiceEndPoint.getPokemonEndPoint(id: id), method: .get) { response  in
            switch response {
            case .success(let data):
                complete(data,nil)
            case .failure(let error):
                complete(nil,error)
            }
        }
    }

    func fetchPokemonSprites(id: String) -> URL? {
           URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png")
    }
    func getPokemonOfficialArtwork(id: String) -> URL?{
           URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png")
    }
}
