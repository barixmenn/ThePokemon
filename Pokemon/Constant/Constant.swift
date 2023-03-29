//
//  ConstantService.swift
//  Pokemon
//
//  Created by Baris on 28.03.2023.
//https://pokeapi.co/api/v2/pokemon/?offset=0&limit=25

import Foundation
    enum ServiceEndPoint : String {
        case BASE_URL = "https://pokeapi.co/api/v2/pokemon/?offset=0&limit="
        case LIMIT = "25"
        case PATH = "https://pokeapi.co/api/v2/pokemon/"
        
        static func pokemonEndPoint() -> String {
            "\(BASE_URL.rawValue)\(LIMIT.rawValue)"
        }
        
        static func getPokemonEndPoint (id: String) -> String {
            "\(PATH.rawValue)\(id)/"
        }
    }

