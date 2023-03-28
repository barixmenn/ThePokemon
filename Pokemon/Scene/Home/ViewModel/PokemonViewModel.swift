//
//  PokemonViewModel.swift
//  Pokemon
//
//  Created by Baris on 28.03.2023.
//

import Foundation

protocol PokemonViewModelProtocol {
    func getPokemon(completion: @escaping ((String?) ->Void))
    func getPokemonSpritesURL(index:Int) -> URL?
    
}
final class PokemonViewModel: PokemonViewModelProtocol {
    let manager = PokemonManager.shared
    var pokemons: [GetPokemonsResponse.Pokemon] = []
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
    
    func getPokemonSpritesURL(index: Int) -> URL? {
        let pokemon = pokemons[index]
        return PokemonManager.shared.fetchPokemonSprites(id: pokemon.pokemonID)!
    }
    func getPokemonDetailURL(for index: Int) -> URL {
        let pokemon = pokemons[index]
        return PokemonManager.shared.getPokemonOfficialArtwork(id: pokemon.pokemonID)!
    }
    
    
}



