//
//  DetailViewModel.swift
//  Pokemon
//
//  Created by Baris on 28.03.2023.
//

import Foundation
protocol PekomonDetailProtocol {
    func fetchPokemonDetails(completion: @escaping (String?) -> ())
}

final class PokemonDetailViewModel: PekomonDetailProtocol {
 
    // MARK: - Properties
    let manager = PokemonManager.shared
    
    var abilities: [Ability]?
    var stats: [Stat]?
    
    var pokemonId: String
    var name: String?
    var imageURL: URL?
    
    // MARK: - Initializers
    init(pokemonId: String,name: String?,imageURL: URL?) {
        self.pokemonId = pokemonId
        self.imageURL = imageURL
        self.name = name
    }
}

extension PokemonDetailViewModel {
    func fetchPokemonDetails(completion: @escaping (String?) -> ()) {
        manager.fetchPokemon(id: pokemonId) { [weak self] response, error in
            guard let self = self else { return }
            self.name = response?.name
            self.abilities = response?.abilities
            self.stats = response?.stats
            if let urlString = response?.sprites?.other?.officialArtwork?.frontDefault {
                self.imageURL = URL(string: urlString)
            }
            completion(error?.localizedDescription)
        }
    }
    
}


