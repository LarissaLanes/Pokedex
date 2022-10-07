//
//  PokemonsImage.swift
//  PokedexApp
//
//  Created by Larissa de Souza Lanes Goncalves on 21/09/22.
//

import Foundation

struct PokemonsDefault: Decodable {
     let sprites: Sprites
    
    init(sprites: Sprites){
        self.sprites = sprites
    }
}

struct Sprites: Decodable {
    let other: OtherPoke
    let versions: Versions
    
    init(other: OtherPoke, versions: Versions) {
        self.other = other
        self.versions = versions
    }
}

//OtherPoke
struct OtherPoke: Decodable {
    let officialArtwork: Image
    let home: Home
    
    init(officialArtwork: Image, home: Home ){
        self.officialArtwork = officialArtwork
        self.home = home
    }
    
    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
        case home = "home"
    }
}

struct Image: Decodable {
    let frontDefault: String
    
    init(frontDefault: String){
        self.frontDefault = frontDefault
    }
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
    
}

struct Home: Decodable {
    let frontDefault: String
    
    init(frontDefault: String)  {
        self.frontDefault = frontDefault
    }
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

//Versions
struct Versions: Decodable {
    let generationV: GenerationV
    let generationIV: GenerationIV
    let generationIII: GenerationIII
    
    init(generationV: GenerationV, generationIV: GenerationIV, generationIII: GenerationIII){
        self.generationV = generationV
        self.generationIV = generationIV
        self.generationIII = generationIII
    }
    
    enum CodingKeys: String, CodingKey {
        case generationV = "generation-v"
        case generationIV = "generation-iv"
        case generationIII = "generation-iii"
    }
}

struct GenerationV: Decodable {
    let blackWhite: BlackWhite
    
    init(blackWhite: BlackWhite){
        self.blackWhite = blackWhite
    }
    
    enum CodingKeys: String, CodingKey {
        case blackWhite = "black-white"
    }
}

struct GenerationIV: Decodable {
    let diamond: Diamond
    
    init(diamond: Diamond){
        self.diamond = diamond
    }
    
    enum CodingKeys: String, CodingKey {
        case diamond = "diamond-pearl"
    }
}

struct GenerationIII: Decodable {
    let emerald : Emerald
    
    init(emerald: Emerald){
        self.emerald = emerald
    }
}

struct Emerald: Decodable {
    let frontDefault: String
    let frontShiny: String
    
    init(frontDefault: String, frontShiny: String){
        self.frontDefault = frontDefault
        self.frontShiny = frontShiny
    }
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}

struct BlackWhite: Decodable{
    let animated: Animated
    
    init(animated: Animated){
        self.animated = animated
    }
}

struct Animated: Decodable {
    let frontDefault: String
    let backDefault: String
    
    init(frontDefault: String, backDefault: String){
        self.frontDefault = frontDefault
        self.backDefault = backDefault
    }
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case backDefault = "back_default"
    }
}

struct Diamond: Decodable {
    let frontShiny: String
    
    init(frontShiny: String){
        self.frontShiny = frontShiny
    }
    
    enum CodingKeys: String, CodingKey {
        case frontShiny = "front_shiny"
    }
}
