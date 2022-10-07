//
//  ApiServices.swift
//  PokedexApp
//
//  Created by Larissa de Souza Lanes Goncalves on 21/09/22.
//

import Foundation

class Request {
    
    private static let basePath = "https://api-pokemons-go.herokuapp.com/pokemon/all/1/0"
    private static let baseImagePath = "https://pokeapi.co/api/v2/pokemon/"
    
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-type" : "application/json"]
        return config
    }()
    
    private static let session = URLSession(configuration: configuration)
    
    //MARK: - GetAllPokemons
    class func loadPokemons(onComplete: @escaping ([Pokemons]) -> Void, onError: @escaping (Errors) -> Void) {
        guard let url = URL(string: basePath) else {
            onError(.url)
            return
        }
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    onError(.noResponse)
                    return
                }
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do{
                        let poke = try JSONDecoder().decode([Pokemons].self, from: data)
                        onComplete(poke)
                    }catch{
                        print(error.localizedDescription)
                        onError(.invalidJson)
                    }
                }else {
                    print("Algum status invalido pelo servidor")
                    onError(.responseStatusCode(code: response.statusCode))
                }
            } else {
                print(error!)
                onError(.taskError(error: error!))
            }
        }
        dataTask.resume()
    }
    
    //MARK: - GetImages
    class func loadImage(name: String, onComplete: @escaping (Sprites) -> Void, onError: @escaping (Errors) -> Void) {
        guard let url = URL(string: "\(baseImagePath)\(name.lowercased())") else {
            onError(.url)
            return
        }
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    onError(.noResponse)
                    return
                }
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do{
                        let image = try JSONDecoder().decode(PokemonsDefault.self, from: data)
                        onComplete(image.sprites)
                    }catch{
                        print(error.localizedDescription)
                        onError(.invalidJson)
                    }
                }else {
                    print("Algum status invalido pelo servidor")
                    onError(.responseStatusCode(code: response.statusCode))
                }
            } else {
                print(error!)
                onError(.taskError(error: error!))
            }
        }
        dataTask.resume()
    }
}

