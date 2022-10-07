//
//  CarrouselTableViewCell.swift
//  PokedexApp
//
//  Created by Larissa de Souza Lanes Goncalves on 03/10/22.
//

import UIKit

class CarrouselTableViewCell: UITableViewCell {
  
    @IBOutlet weak var collection: UICollectionView!
    
    var imagePoke: Sprites!
    
    var index: [String] = ["0", "1", "2", "3", "4", "5"]
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 160, height: 160)
        layout.sectionInset = UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
        
        collection.setCollectionViewLayout(layout, animated: false)
        collection.delegate = self
        collection.dataSource = self
        collection.register(UINib(nibName: "ImageVersionsCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "ImageVersionsCollectionViewCell")
    }
    
    func configureCell(pokemons: Pokemons) {
        PokemonsPresenter.BackgroundColor(type: pokemons.type1, view: self.collection)
    }
}

extension CarrouselTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        index.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageVersionsCollectionViewCell", for: indexPath) as! ImageVersionsCollectionViewCell
        cell.configureCell(imageIndex: index[indexPath.row], imageUrl: imagePoke)
        
        return cell
    }
}
