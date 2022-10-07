//
//  ImageVersionsCollectionViewCell.swift
//  PokedexApp
//
//  Created by Larissa de Souza Lanes Goncalves on 03/10/22.
//

import UIKit

class ImageVersionsCollectionViewCell: UICollectionViewCell {
        
    @IBOutlet weak var imagesCarrosel: UIImageView!
    @IBOutlet var background: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.background.layer.cornerRadius = 10
        self.background.backgroundColor = .white
        self.background.layer.shadowOpacity = 0.3
        self.background.alpha = 0.7
    }

    func configureCell(imageIndex: String, imageUrl: Sprites) {
        
        switch imageIndex{
        case "0":
            PokemonsPresenter.CovertUrl(urlImage: imageUrl.other.home.frontDefault, imageView: imagesCarrosel)
        case "1":
            PokemonsPresenter.CovertUrl(urlImage: imageUrl.versions.generationIII.emerald.frontShiny, imageView: imagesCarrosel)
        case "2":
            PokemonsPresenter.CovertUrl(urlImage: imageUrl.versions.generationIV.diamond.frontShiny, imageView: imagesCarrosel)
        case "3":
            PokemonsPresenter.CovertUrl(urlImage: imageUrl.versions.generationV.blackWhite.animated.frontDefault, imageView: imagesCarrosel)
        case "4":
            PokemonsPresenter.CovertUrl(urlImage: imageUrl.versions.generationV.blackWhite.animated.backDefault, imageView: imagesCarrosel)
        case "5":
            PokemonsPresenter.CovertUrl(urlImage: imageUrl.versions.generationIII.emerald.frontDefault, imageView: imagesCarrosel)
        default:
            imagesCarrosel.image = UIImage(named: "")
        }
    }
}
