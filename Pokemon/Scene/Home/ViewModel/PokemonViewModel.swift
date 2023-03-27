//
//  PokemonViewModel.swift
//  Pokemon
//
//  Created by Baris on 28.03.2023.
//

import Foundation

protocol PokemonViewModelProtocol {
    func getPokemon(completion: @escaping ((String?) ->Void))
}
final class PokemonViewModel: PokemonViewModelProtocol {
    let manager = PokemonManager.shared
    var pokemons : GetPokemonsResponse?
}

extension PokemonViewModel {
    func getPokemon(completion: @escaping ((String?) -> Void)) {
        manager.fetchPokemon { pokemons, error in
            if pokemons != nil {
                self.pokemons = pokemons
            }
            completion(error?.localizedDescription)
        }
    }
}


