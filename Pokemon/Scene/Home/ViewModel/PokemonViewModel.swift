//
//  PokemonViewModel.swift
//  Pokemon
//
//  Created by Baris on 28.03.2023.
//

import Foundation

protocol PokemonViewModelProtocol {
    func getPokemon(completion: @escaping ((String?) ->Void))
    func getPokemonSprites(index:Int) -> URL?
    
}
final class PokemonViewModel: PokemonViewModelProtocol {
    let manager = PokemonManager.shared
    var pokemons: [Pokemon] = []
}

extension PokemonViewModel {
    func getPokemon(completion: @escaping ((String?) -> Void)) {
        manager.fetchPokemons { pokemons, error in
            if pokemons != nil {
                self.pokemons = pokemons?.results ?? []
            }
            completion(error?.localizedDescription)
        }
    }
    
    func getPokemonSprites(index: Int) -> URL? {
        let pokemon = pokemons[index]
        return PokemonManager.shared.fetchPokemonSprites(id: pokemon.pokemonID)!
    }
    
    func getPokemonDetail(for index: Int) -> URL {
        let pokemon = pokemons[index]
        return PokemonManager.shared.getPokemonOfficialArtwork(id: pokemon.pokemonID)!
    }
    
    
}



