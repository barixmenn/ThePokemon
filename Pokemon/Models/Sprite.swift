//
//  Sprite.swift
//  Pokemon
//
//  Created by Baris on 28.03.2023.
//

import Foundation


// MARK: - PokemonDetailResponse
struct PokemonDetailResponse: Codable {
    let abilities: [Ability]?
    let forms: [Species]?
    let id: Int?
    let name: String?
    let order: Int?
    let species: Species?
    let sprites: Sprites?
    let stats: [Stat]?
    
    enum CodingKeys: String, CodingKey {
        case abilities
        case forms
        case id
        case name, order
        case species, sprites, stats
    }
}

// MARK: - Ability
struct Ability: Codable {
    let ability: Species?
    enum CodingKeys: String, CodingKey {
        case ability
    }
}

// MARK: - Species
struct Species: Codable {
    let name: String?
    let url: String?
}

// MARK: - Sprites
class Sprites: Codable {
    let backDefault, backFemale, backShiny, backShinyFemale: String?
    let frontDefault, frontFemale, frontShiny, frontShinyFemale: String?
    let other: Other?
    let animated: Sprites?
    
    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
        case other, animated
    }
    
    init(backDefault: String?, backFemale: String?, backShiny: String?, backShinyFemale: String?, frontDefault: String?, frontFemale: String?, frontShiny: String?, frontShinyFemale: String?, other: Other?,  animated: Sprites?) {
        self.backDefault = backDefault
        self.backFemale = backFemale
        self.backShiny = backShiny
        self.backShinyFemale = backShinyFemale
        self.frontDefault = frontDefault
        self.frontFemale = frontFemale
        self.frontShiny = frontShiny
        self.frontShinyFemale = frontShinyFemale
        self.other = other
        self.animated = animated
    }
}


// MARK: - OfficialArtwork
struct OfficialArtwork: Codable {
    let frontDefault, frontShiny: String?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}


// MARK: - DreamWorld
struct DreamWorld: Codable {
    let frontDefault: String?
    let frontFemale: String?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
    }
}


// MARK: - Other
struct Other: Codable {
    let dreamWorld: DreamWorld?
    let officialArtwork: OfficialArtwork?
    
    enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case officialArtwork = "official-artwork"
    }
}

// MARK: - Stat
struct Stat: Codable {
    let baseStat, effort: Int?
    let stat: Species?
    
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

