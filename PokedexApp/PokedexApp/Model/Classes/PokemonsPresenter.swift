//
//  PokemonsPresenter.swift
//  PokedexApp
//
//  Created by Larissa de Souza Lanes Goncalves on 21/09/22.
//

import Foundation
import UIKit

class PokemonsPresenter {

    class func CovertUrl(urlImage: String, imageView: UIImageView) {
        if let url = URL(string: urlImage) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    imageView.image = UIImage(data: data)
                }
            }
            task.resume()
        }
    }
    
    class func BackgroundColor(type: String, view: UIView){
        switch type {
        case "grass":
            view.backgroundColor = .grass
        case "fire":
            view.backgroundColor = .fire
        case "water":
            view.backgroundColor = .water
        case "bug":
            view.backgroundColor = .bug
        case "normal":
            view.backgroundColor = .normal
        case "poison":
            view.backgroundColor = .poison
        case "electric":
            view.backgroundColor = .electric
        case "ground":
            view.backgroundColor = .ground
        case "fairy":
            view.backgroundColor = .fairy
        case "fighting":
            view.backgroundColor = .fighting
        case "psychic":
            view.backgroundColor = .psychic
        case "rock":
            view.backgroundColor = .rock
        case "ghost":
            view.backgroundColor = .ghost
        case "ice":
            view.backgroundColor = .ice
        case "dragon":
            view.backgroundColor = .dragon
        case "dark":
            view.backgroundColor = .dark
        case "steel":
            view.backgroundColor = .steel
        default:
            view.backgroundColor = .systemGray
        }
    }
    
    class func ImageType(type: String, image: UIImageView){
        switch type{
        case "grass":
            image.image = .grass
            case "fire":
            image.image = .fire
            case "water":
            image.image = .water
            case "bug":
            image.image = .bug
            case "normal":
            image.image = .normal
            case "poison":
            image.image = .poison
            case "electric":
            image.image = .electric
            case "ground":
            image.image = .ground
            case "fairy":
            image.image = .fairy
            case "fighting":
            image.image = .fighting
            case "psychic":
            image.image = .psychic
            case "rock":
            image.image = .rock
            case "ghost":
            image.image = .ghost
            case "ice":
            image.image = .ice
            case "dragon":
            image.image = .dragon
            case "dark":
            image.image = .dark
            case "steel":
            image.image = .steel
            default:
            image.image = UIImage(named: "backgroundPoke")
        }
    }
}
