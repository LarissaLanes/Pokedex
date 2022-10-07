//
//  PokemonsTableViewController.swift
//  PokedexApp
//
//  Created by Larissa de Souza Lanes Goncalves on 21/09/22.
//

import UIKit

class PokemonsTableViewController: UITableViewController {

    var selectedRow = 0
    var pokemons: [Pokemons] = []
    var image: Sprites?
        
    var labelLoading: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .power
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        labelLoading.text = "Carregando Pokemons..."
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PokemonsTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "PokemonsTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Request.loadPokemons(onComplete: { (pokemons) in
            DispatchQueue.main.async {
                self.pokemons = pokemons
                self.tableView.reloadData()
            }
        }) { (error) in
            print(error)
        }
    }
    
    func callImagePokemon(name: String) {
        Request.loadImage(name: name, onComplete: { (image) in
            DispatchQueue.main.async {
                self.image = image
            }
        }) { (error) in
            print(error)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundView = pokemons.count == 0 ? labelLoading : nil
        return pokemons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonsTableViewCell", for: indexPath) as! PokemonsTableViewCell
        cell.configureCell(pokemons: pokemons[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedRow = indexPath.row

        tableView.deselectRow(at: indexPath, animated: true)
        let infoViewController = storyboard?.instantiateViewController(withIdentifier: "DetailsPokemons") as! InfoViewController
        infoViewController.pokemonsDetails = pokemons[self.selectedRow]
        
        Request.loadImage(name: pokemons[self.selectedRow].name, onComplete: { (image) in
            DispatchQueue.main.async {
                self.image = image
                infoViewController.pokemonImage = image
                self.present(infoViewController, animated:true, completion:nil)
                }
        }) { (error) in
            print(error)
        }
    }
}
