//
//  Pokemon.swift
//  Pokemon
//
//  Created by Baris on 28.03.2023.
//

import Foundation

struct GetPokemonsResponse: Codable {
    let count: Int
    let next: String
    let results: [Pokemon]
    
    struct Pokemon: Codable {
        let name: String
        let url: String
    }

    
}

extension GetPokemonsResponse.Pokemon {
    var pokemonID: String {
        URL(string: url)?.lastPathComponent ?? ""
    }
}
