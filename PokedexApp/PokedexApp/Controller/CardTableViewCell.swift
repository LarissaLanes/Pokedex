//
//  CardTableViewCell.swift
//  PokedexApp
//
//  Created by Larissa de Souza Lanes Goncalves on 29/09/22.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    @IBOutlet weak var weather: UILabel!
    @IBOutlet weak var types: UILabel!
    @IBOutlet weak var familyId: UILabel!
    @IBOutlet weak var atk: UILabel!
    @IBOutlet weak var generation: UILabel!
    @IBOutlet weak var stage: UILabel!
    @IBOutlet weak var colorView1: UIView!
    @IBOutlet weak var colorView2: UIView!
    @IBOutlet weak var cardBackgroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        self.colorView1.layer.cornerRadius = colorView1.frame.height / 2
        self.colorView1.layer.borderWidth = 0.5
        self.colorView1.layer.borderColor = UIColor.black.cgColor
        self.colorView1.layer.shadowOpacity = 0.1

        self.colorView2.layer.cornerRadius = colorView1.frame.height / 2
        self.colorView2.layer.borderWidth = 0.5
        self.colorView2.layer.borderColor = UIColor.black.cgColor
        self.colorView2.layer.shadowOpacity = 0.1

        self.cardBackgroundView.layer.cornerRadius = 10
        self.cardBackgroundView.backgroundColor = .white
        self.cardBackgroundView.alpha = 0.7
        self.cardBackgroundView.layer.shadowOpacity = 0.3
    }
    
    func configureCell(pokemons: Pokemons){
        weather.text = pokemons.weather2 == "" ? "\(pokemons.weather1)" : "\(pokemons.type1)/\(pokemons.weather2)"
        types.text = pokemons.type2 == "" ? "\(pokemons.type1)" : "\(pokemons.type1)/\(pokemons.type2)"
        familyId.text = String(pokemons.familyId)
        atk.text = String(pokemons.statTotal)
        generation.text = String("\(pokemons.generation)º")
        stage.text = String("\(pokemons.evolutionStage)º")
        PokemonsPresenter.BackgroundColor(type: pokemons.type1, view: colorView1)
        PokemonsPresenter.BackgroundColor(type: pokemons.type2, view: colorView2)
    }
}
