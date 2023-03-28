//
//  PokemonManager.swift
//  Pokemon
//
//  Created by Baris on 28.03.2023.
//


import Foundation

protocol PokemonManagerProtocol {
    func fetchPokemons(complete: @escaping((GetPokemonsResponse?,Error?) -> ()))
    func fetchPokemonSprites(id:String) -> URL?
    //func fetchPokemon(id: String, complete: @escaping((PokemonDetailResponse?,Error?) -> ()))
}

final class PokemonManager: PokemonManagerProtocol {
    static let shared = PokemonManager()
}

extension PokemonManager {
    
    func fetchPokemons(complete: @escaping ((GetPokemonsResponse?, Error?) -> ())) {
        NetworkManager.shared.request(type: GetPokemonsResponse.self, url: Constant.ServiceEndPoint.pokemonEndPoint(), method: .get) { response in
            switch response {
            case .success(let data):
                complete(data,nil)
            case .failure(let error):
                complete(nil,error)
            }
        }
    }
    
    
    func getPokemon(by id: String, completion: @escaping (PokemonDetailResponse) -> Void) {
            guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)/") else { return }
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else { return }
                do {
                    let response = try JSONDecoder().decode(PokemonDetailResponse.self, from: data)
                    completion(response)
                } catch let error {
                    print(error.localizedDescription)
                }
            }.resume()
        }
    
    
    
    func fetchPokemonSprites(id: String) -> URL? {
           URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png")
    }
    func getPokemonOfficialArtwork(id: String) -> URL?{
           URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png")
    }
}
