//
//  PowerPorcentTableViewCell.swift
//  PokedexApp
//
//  Created by Larissa de Souza Lanes Goncalves on 05/10/22.
//

import UIKit

class PowerPorcentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewBack: UIView!
    @IBOutlet weak var backgroundViewBack: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
    let multiply = 100 / 100
    
    let backgroundViewOne = UIView.backgroundViewProgressBar()
    let backgroundViewTwo = UIView.backgroundViewProgressBar()
    let backgroundViewThree = UIView.backgroundViewProgressBar()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewBack.layer.cornerRadius = 8
        viewBack.alpha = 0.7
        viewBack.backgroundColor = .white
        viewBack.layer.shadowOpacity = 0.3
        
        view1.addSubview(backgroundViewOne)
        view2.addSubview(backgroundViewTwo)
        view3.addSubview(backgroundViewThree)
    }

    func configureCell(pokemons: Pokemons){
        PokemonsPresenter.BackgroundColor(type: pokemons.type1, view: backgroundViewBack)
        
        let progressViewOne = UIView.viewProgressBar(width: CGFloat(pokemons.atk * multiply), color: .power)
        backgroundViewOne.addSubview(progressViewOne)
        let progressViewTwo = UIView.viewProgressBar(width: CGFloat(pokemons.def * multiply), color: .power)
        backgroundViewTwo.addSubview(progressViewTwo)
        let progressViewThree = UIView.viewProgressBar(width: CGFloat(pokemons.sta * multiply), color: .power)
        backgroundViewThree.addSubview(progressViewThree)
        
        let labelAtk = UILabel.label(text: String("\(pokemons.atk)%"), width: CGFloat(pokemons.atk * multiply))
        progressViewOne.addSubview(labelAtk)
        let labelDef = UILabel.label(text: String("\(pokemons.def)%"), width:  CGFloat(pokemons.def * multiply))
        progressViewTwo.addSubview(labelDef)
        let labelSta = UILabel.label(text: String("\(pokemons.sta)%"), width: CGFloat(pokemons.sta * multiply))
        progressViewThree.addSubview(labelSta)
    }
}




