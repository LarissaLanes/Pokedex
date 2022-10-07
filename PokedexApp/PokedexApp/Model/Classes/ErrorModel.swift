//
//  ErrorModel.swift
//  PokedexApp
//
//  Created by Larissa de Souza Lanes Goncalves on 21/09/22.
//

import Foundation

enum Errors {
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJson
}
