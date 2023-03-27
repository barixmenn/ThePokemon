//
//  ConstantService.swift
//  Pokemon
//
//  Created by Baris on 28.03.2023.
//https://pokeapi.co/api/v2/pokemon/?offset=0&limit=25

import Foundation



extension Constant {
    
    enum ServiceEndPoint : String {
        case BASE_URL = "https://pokeapi.co/api/v2/pokemon/?offset=0&limit="
        case LIMIT = "25"
        
        static func pokemonEndPoint() -> String {
            "\(BASE_URL.rawValue)\(LIMIT.rawValue)"
        }
    }
}
