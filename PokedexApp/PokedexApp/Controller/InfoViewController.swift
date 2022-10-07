//
//  InfoViewController.swift
//  PokedexApp
//
//  Created by Larissa de Souza Lanes Goncalves on 22/09/22.
//

import UIKit

class InfoViewController: UIViewController {

    var pokemonsDetails: Pokemons!
    var pokemonImage: Sprites!
    var data = [[CardTableViewCell()],[CarrouselTableViewCell()],[PowerPorcentTableViewCell()]]
        
    let gradientLayer:CAGradientLayer = CAGradientLayer()

    @IBOutlet weak var iconFav: UIImageView!
    @IBOutlet weak var btClose: UIButton!
    @IBOutlet weak var labelId: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelTypeOne: UILabel!
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var modalView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var labelBackground: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCell()
        layout()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CardTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "CardTableViewCell")
        tableView.register(UINib(nibName: "CarrouselTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "CarrouselTableViewCell")
        tableView.register(UINib(nibName: "PowerPorcentTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "PowerPorcentTableViewCell")
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func layout() {
        labelId.textColor = .white
        labelName.textColor = .white
        labelTypeOne.textColor = .black
        
        labelBackground.layer.cornerRadius = 14
        labelBackground.backgroundColor = .white
        labelBackground.alpha = 0.5
        
        modalView.layer.cornerRadius = modalView.frame.height / 8
        modalView.layer.shadowOpacity = 0.3
        
        gradientLayer.frame.size = self.backgroundView.frame.size
        gradientLayer.colors = [UIColor.white.withAlphaComponent(0.5).cgColor, PokemonsPresenter.BackgroundColor(type: pokemonsDetails.type1, view: backgroundView)]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        backgroundView.layer.addSublayer(gradientLayer)
    }
    
    func configureCell() {
        labelId.text = String("#00\(pokemonsDetails.pokedexNumber)")
        labelName.text = pokemonsDetails.name
        labelTypeOne.text = pokemonsDetails.type1
        iconFav.image = UIImage(systemName: "")
        PokemonsPresenter.ImageType(type: pokemonsDetails.type1, image: iconFav)
        PokemonsPresenter.CovertUrl(urlImage: pokemonImage.other.officialArtwork.frontDefault, imageView: ivImage)
        PokemonsPresenter.BackgroundColor(type: pokemonsDetails.type1, view: modalView)
        PokemonsPresenter.BackgroundColor(type: pokemonsDetails.type1, view: self.tableView)
   }
}

extension InfoViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return data[section].count
        } else if section == 1 {
            return data[section].count
        }else {
            return data[section].count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         if indexPath.section == 0 {
             let cell = tableView.dequeueReusableCell(withIdentifier: "CardTableViewCell", for: indexPath) as! CardTableViewCell
             cell.configureCell(pokemons: pokemonsDetails)
             
            return cell
         }else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CarrouselTableViewCell", for: indexPath) as! CarrouselTableViewCell
             cell.imagePoke = pokemonImage
             cell.configureCell(pokemons: pokemonsDetails)
             
            return cell
         }else {
             let cell = tableView.dequeueReusableCell(withIdentifier: "PowerPorcentTableViewCell", for: indexPath) as! PowerPorcentTableViewCell
             cell.configureCell(pokemons: pokemonsDetails)
             return cell
         }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230.0
    }
}
        
