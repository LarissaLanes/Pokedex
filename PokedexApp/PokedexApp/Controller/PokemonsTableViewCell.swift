//
//  PokemonsTableViewCell.swift
//  PokedexApp
//
//  Created by Larissa de Souza Lanes Goncalves on 21/09/22.
//

import UIKit

class PokemonsTableViewCell: UITableViewCell {

    var image: String = ""
    
    @IBOutlet weak var backgroudViewColor: UIView!
    @IBOutlet weak var pokeName: UILabel!
    @IBOutlet weak var pokeTypeOne: UILabel!
    @IBOutlet weak var pokeNumber: UILabel!
    @IBOutlet weak var pokeImageView: UIImageView!
    @IBOutlet weak var pokedexImage: UIImageView!
    @IBOutlet weak var labelBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroudViewColor.layer.cornerRadius = 72 / 5
        backgroudViewColor.layer.shadowOpacity = 0.4
        
        labelBackground.layer.cornerRadius = 13
        labelBackground.backgroundColor = .white
        labelBackground.alpha = 0.5
        
        pokeName.textColor = .white
        pokeTypeOne.textColor = .black
        pokeNumber.textColor = .white
    }
    
    func configureCell(pokemons: Pokemons){
        pokeName.text = pokemons.name
        pokeTypeOne.text = pokemons.type1
        pokeNumber.text = String("#00\(pokemons.pokedexNumber)")
        PokemonsPresenter.ImageType(type: pokemons.type1, image: pokedexImage)
        pokeImageView?.image = UIImage(named: "image")
        PokemonsPresenter.CovertUrl(urlImage: image, imageView: pokeImageView)
        backgroudViewColor.backgroundColor = .systemGray
        PokemonsPresenter.BackgroundColor(type: pokemons.type1, view: backgroudViewColor)
    }
}
