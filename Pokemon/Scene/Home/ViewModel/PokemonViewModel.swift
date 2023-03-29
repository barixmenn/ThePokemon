//
//  PokemonViewModel.swift
//  Pokemon
//
//  Created by Baris on 28.03.2023.
//

import Foundation

protocol PokemonViewModelProtocol: AnyObject {
    func didErrorList(error: String)
    func didSuccessList()
    
}
final class PokemonViewModel {
    var delegate : PokemonViewModelProtocol?
    private let manager = PokemonManager.shared
    var pokemons: [Pokemon] = []
   
}

extension PokemonViewModel {
    func getPokemon() {
        manager.fetchPokemons { pokemons, error in
            if pokemons != nil {
                self.pokemons = pokemons?.results ?? []
                self.delegate?.didSuccessList()
            }
            self.delegate?.didErrorList(error: error?.localizedDescription ?? "error")
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



