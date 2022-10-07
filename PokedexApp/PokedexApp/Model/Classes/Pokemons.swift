//
//  Pokemons.swift
//  PokedexApp
//
//  Created by Larissa de Souza Lanes Goncalves on 21/09/22.
//

import Foundation

class Pokemons: Decodable {
    
     let id: Int
     let name: String
     let pokedexNumber: Int
     let generation: Int
     let evolutionStage: Int
     let familyId: Int
     let type1: String
     let type2: String
     let weather1: String
     let weather2: String
     let statTotal: Int
     let atk: Int
     let def: Int
     let sta: Int
    
    init (
       id: Int,
       name: String,
       pokedexNumber: Int,
       generation: Int,
       evolutionStage: Int,
       familyId: Int,
       type1: String,
       type2: String,
       weather1: String,
       weather2: String,
       statTotal: Int,
       atk: Int,
       def: Int,
       sta: Int
    ){
        self.id = id
        self.name = name
        self.pokedexNumber = pokedexNumber
        self.generation = generation
        self.evolutionStage = evolutionStage
        self.familyId = familyId
        self.type1 = type1
        self.type2 = type2
        self.weather1 = weather1
        self.weather2 = weather2
        self.statTotal = statTotal
        self.atk = atk
        self.def = def
        self.sta = sta
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case pokedexNumber = "pokedex_number"
        case generation = "generation"
        case evolutionStage = "evolution_stage"
        case familyId = "family_id"
        case type1 = "type_1"
        case type2 = "type_2"
        case weather1 = "weather_1"
        case weather2 = "weather_2"
        case statTotal = "stat_total"
        case atk = "atk"
        case def = "def"
        case sta = "sta"
    }
    
}

